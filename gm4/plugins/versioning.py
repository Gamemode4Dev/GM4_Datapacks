from typing import List

from beet import Context, Function, FunctionTag, PluginOptions, configurable
from beet.contrib.rename_files import rename_files
from beet.contrib.find_replace import find_replace
from pydantic import Field
import warnings
from gm4.utils import Version, NoneAttribute
import gm4.plugins.manifest # for ManifestCacheModel; a runtime circular dependency

class VersionInjectionConfig(PluginOptions):
    functions: list[str] = []
    advancements: list[str] = []

class VersioningConfig(PluginOptions, extra="ignore"):
    echecks: list[str] = []
    schedule_loops: list[str] = []
    required: dict[str, str] = {}
    extra_version_injections: VersionInjectionConfig = Field(default=VersionInjectionConfig())

@configurable("gm4.versioning", validator=VersioningConfig)
def modules(ctx: Context, opts: VersioningConfig):
    """Assembles version-functions for modules from dependency information:
        - load:{module_name}.json
        - {module_name}:load.mcfunction
        - {module_name}:echecks.mcfunction
        - load:load.json
    """
    ctx.cache["currently_building"].json = {"name": ctx.project_name, "id": ctx.project_id, "added_libs": []} # cache module's project id for access within library pipelines
    dependencies = opts.required
    manifest = gm4.plugins.manifest.ManifestCacheModel.model_validate(ctx.cache["gm4_manifest"].json)
    dependency_check_command = "execute "
    log_message_commands: List[str] = []

    # {{module_name}}.json tag
    load_tag = dependency_load_tags(ctx, dependencies)
    load_tag.add(f"{ctx.project_id}:load")
    ctx.data.function_tags[f"load:{ctx.project_id}"] = load_tag

    # load.mcfunction
    base_ver = manifest.base["version"]
    dependencies = {"gm4":base_ver}|dependencies # manually insert base version as dependency, assumed to be current base version

    for dep_id, ver_str in dependencies.items():
        dep_ver = Version(ver_str)
        warn_on_future_version(ctx, dep_id, dep_ver)

        name_default_dict = {"name":"Gamemode 4 Base"} if dep_id == "gm4" else {"name":dep_id}
        manifest_entry = manifest.modules.get(dep_id)
        dep_name = manifest_entry.name if manifest_entry else name_default_dict["name"]

        if dep_id not in manifest.modules and dep_id != "gm4":
            dep_id = manifest.libraries.get(dep_id, NoneAttribute()).id

        # append to startup check
        dependency_check_command += f"if score {dep_id} load.status matches {dep_ver.major} if score {dep_id}_minor load.status matches {dep_ver.minor}.. "

        # failure logs
        log_message_commands.append(f"execute unless score {dep_id} load.status matches 1.. run data modify storage gm4:log queue append value {{type:\"missing\",module:\"{ctx.project_name}\",id:\"{ctx.project_id}\",require:\"{dep_name}\",require_id:\"{dep_id}\"}}")

        log_data = f"{{type:\"version_conflict\",module:\"{ctx.project_name}\",id:\"{ctx.project_id}\",require:\"{dep_name}\",require_id:\"{dep_id}\",require_ver:\"{dep_ver}\"}}"
        log_message_commands.append(f"execute if score {dep_id} load.status matches 1.. unless score {dep_id} load.status matches {dep_ver.major} run data modify storage gm4:log queue append value {log_data}")
        log_message_commands.append(f"execute if score {dep_id} load.status matches {dep_ver.major} unless score {dep_id}_minor load.status matches {dep_ver.minor}.. run data modify storage gm4:log queue append value {log_data}")

    # add environment check requests
    echeck_requests: List[str] = []
    for namespaced_echeck in opts.echecks:
        match namespaced_echeck.split(":"):
            case [
                check
            ]:  # if no namespace is given, assume current project's namespace
                namespace = ctx.project_id
            case [namespace, check]:
                pass
            case _:
                raise ValueError(f"{namespaced_echeck} is not a valid environment check name!")
        echeck_requests.append(f"execute unless data storage gm4:log echecks[{{echeck_id:\"{namespace}:{check}\"}}] run data modify storage gm4:log echecks append value {{echeck_id:\"{namespace}:{check}\",required_by:[],result:{{passed:-1}}}}")
        echeck_requests.append(f"data modify storage gm4:log echecks[{{echeck_id:\"{namespace}:{check}\"}}].required_by append value \"{ctx.project_id}\"")

    if 0 < len(echeck_requests):  # append an empty line to envcheck command list if there is at least one envcheck
        echeck_requests.append("")

    # parse module version
    module_ver = Version(ctx.project_version)

    # otherwise, log failed startup with -1 load.status
    log_message_commands.append(f"execute unless score {ctx.project_id} load.status matches 1.. run scoreboard players set {ctx.project_id} load.status -1")

    log_message_commands.append('')
    # start module clocks
    log_message_commands.append(f"execute if score {ctx.project_id} load.status matches {module_ver.major} run function {ctx.project_id}:init")

    # unschedule clocks
    for function in opts.schedule_loops:
        namespaced_function = f"{ctx.project_id}:{function}" if ":" not in function else function
        log_message_commands.append(f"execute unless score {ctx.project_id} load.status matches {module_ver.major} run schedule clear {namespaced_function}")

    # populate function
    ctx.data.functions[f"{ctx.project_id}:load"] = Function(
        [
            dependency_check_command
            + f"run scoreboard players set {ctx.project_id} load.status {module_ver.major}",
            dependency_check_command
            + f"run scoreboard players set {ctx.project_id}_minor load.status {module_ver.minor}",
            "",
            *echeck_requests,
            *log_message_commands,
        ]
    )

    # echecks.mcfunction if this data pack defines environment checks
    index_echecks(ctx, module_ver)

    # load.json tag
    ctx.data.function_tags["load:load"] = FunctionTag({
        "values": [
            f"#load:{ctx.project_id}"
        ]
    })

    # inject module load success checks (load.status 1..) into technical and display advancements
    # advancements get score checks injected into every criteria
    versioned_advancements(ctx, Version("X.X.X"), [a for a in ctx.data.advancements.keys() if not a=="gm4:root"], False)

@configurable("gm4.versioning", validator=VersioningConfig)
def libraries(ctx: Context, opts: VersioningConfig):
    """Assembles version-functions for libraries from dependency information:
    - {lib_name}:enumerate.mcfunction
    - {lib_name}:resolve_load.mcfunction
    - {lib_name}:echecks.mcfunction
    - load:{lib_name}.json
    - load:{lib_name}/enumerate.json
    - load:{lib_name}/resolve_load.json
    - load:{lib_name}/dependencies.json
    """
    dependencies = opts.required
    manifest = gm4.plugins.manifest.ManifestCacheModel.model_validate(ctx.cache["gm4_manifest"].json)
    lib_ver = Version(ctx.project_version)

    # enumerate.mcfunction
    lines = [
        f"execute if score {ctx.project_id} load.status matches {lib_ver.major} unless score {ctx.project_id}_minor load.status matches {lib_ver.minor}.. run scoreboard players set {ctx.project_id}_minor load.status {lib_ver.minor}",
        "",
    ]

    dep_check_line = "execute "
    for dep_id, ver_str in dependencies.items():
        dep_ver = Version(ver_str)
        warn_on_future_version(ctx, dep_id, dep_ver)

        if dep_id not in manifest.modules:
            dep_id = manifest.libraries.get(dep_id, NoneAttribute()).id

        dep_check_line += f"if score {dep_id} load.status matches {dep_ver.major} if score {dep_id}_minor load.status matches {dep_ver.minor}.. "

    dep_check_line += f"unless score {ctx.project_id} load.status matches {lib_ver.major}.. run scoreboard players set "

    lines.append(dep_check_line + f"{ctx.project_id}_minor load.status {lib_ver.minor}")
    lines.append(dep_check_line + f"{ctx.project_id} load.status {lib_ver.major}")

    ctx.data.functions[f"{ctx.project_id}:enumerate"] = Function(lines)

    # resolve_load.mcfunction
    lines = [f"execute if score {ctx.project_id} load.status matches {lib_ver.major} if score {ctx.project_id}_minor load.status matches {lib_ver.minor} run function {ctx.project_id}:load"]

    for func in opts.schedule_loops:
        lines.append(f"execute unless score {ctx.project_id} load.status matches {lib_ver.major} run schedule clear {ctx.project_id}:{func}")
        lines.append(f"execute unless score {ctx.project_id}_minor load.status matches {lib_ver.minor} run schedule clear {ctx.project_id}:{func}")

    ctx.data.functions[f"{ctx.project_id}:resolve_load"] = Function(lines)

    # echecks.mcfunction if this data pack defines environment checks
    index_echecks(ctx, lib_ver)

    # load/tags {{ lib name }}.json
    ctx.data.function_tags[f"load:{ctx.project_id}"] = FunctionTag({
        "values": [
            f"#load:{ctx.project_id}/enumerate",
            f"#load:{ctx.project_id}/resolve_load"
        ]
    })

    # load/tags enumerate.json
    ctx.data.function_tags[f"load:{ctx.project_id}/enumerate"] = FunctionTag({
        "values": [
            f"{ctx.project_id}:enumerate"
        ]
    })

    # load/tags resolve_load.json
    ctx.data.function_tags[f"load:{ctx.project_id}/resolve_load"] = FunctionTag({
        "values": [
            f"{ctx.project_id}:resolve_load"
        ]
    })

    # load/tags dependencies.json
    if len(dependencies) > 0:
        dep_tag = dependency_load_tags(ctx, dependencies)
        ctx.data.function_tags[f"load:{ctx.project_id}/dependencies"] = dep_tag
        ctx.data.function_tags[f"load:{ctx.project_id}"].prepend(FunctionTag({
            "values": [
                f"#load:{ctx.project_id}/dependencies"
            ]
        }))

    # additional version injections
    # NOTE functions get version checks replaced onto `load.status` checks
    versioned_functions(ctx, lib_ver, opts.extra_version_injections.functions)

    # stamp version number and module bring packaged into into load.mcfunction
    handle = ctx.data.functions[f"{ctx.project_id}:load"]
    handle.append([
        "\n",
        f"data modify storage gm4:log versions append value {{id:\"{ctx.project_id}\",module:\"{ctx.project_id.replace('gm4', 'lib')}\",version:\"{ctx.project_version}\",from:\"{ctx.cache['currently_building'].json.get('name', 'standalone')}\"}}"
    ])

    # strict version checks on advancements
    versioned_advancements(ctx, lib_ver, opts.extra_version_injections.advancements, strict=True)
    # NOTE it may be possible/desirable to just automatically inject version checks into *all* library advancements

    # put library version number in namespace
    versioned_namespace(ctx, lib_ver)

@configurable("gm4.versioning", validator=VersioningConfig)
def base(ctx: Context, opts: VersioningConfig):
    """Fills in version information to the base functions from the beet.yaml"""
    ver = Version(ctx.project_version)
    # enumerate.mcfunction
    lines = [
        f"execute if score gm4 load.status matches {ver.major} unless score gm4_minor load.status matches {ver.minor}.. run scoreboard players set gm4_minor load.status {ver.minor}",
        "",
        f"execute unless score gm4 load.status matches {ver.major}.. run scoreboard players set gm4_minor load.status {ver.minor}",
        f"execute unless score gm4 load.status matches {ver.major}.. run scoreboard players set gm4 load.status {ver.major}"
    ]
    ctx.data.functions[f"gm4:enumerate"] = Function(lines)

    # resolve_load.mcfunction
    lines = f"execute if score gm4 load.status matches {ver.major} if score gm4_minor load.status matches {ver.minor} run function gm4:load"
    ctx.data.functions[f"gm4:resolve_load"] = Function(lines)

    # resolve_post_load.mcfunction
    lines = f"execute if score gm4 load.status matches {ver.major} if score gm4_minor load.status matches {ver.minor} run function gm4:post_load"
    ctx.data.functions[f"gm4:resolve_post_load"] = Function(lines)

    # index env checks
    index_echecks(ctx, ver)

    versioned_advancements(ctx, ver, opts.extra_version_injections.advancements, strict=True) #type:ignore

    versioned_functions(ctx, ver, opts.extra_version_injections.functions)

    versioned_namespace(ctx, ver)


def versioned_namespace(ctx: Context, version: Version):
    """Puts the project version into the namespace, and renames all references to match
    Used for libraries that may have multiple versions exist in a world at once without
    file overwrites"""
    namespace = ctx.project_id if ctx.project_id != 'base' else 'gm4'
    versioned_namespace = f"{namespace}-{version.major}.{version.minor}"
    ctx.require(rename_files(data_pack={
        "match": {"functions": "*", "advancements": "*", "loot_tables": "*", "predicates": "*"} if namespace != 'gm4' else {"functions": "*", "advancements": "*"},
        "find": f"{namespace}:([a-z_/]+)",
        "replace": f"{versioned_namespace}:\\1"
    }))
    ctx.require(find_replace(data_pack={"match": "*"}, substitute={
        "find": f"(?<![#$])(?<!storage )(?<!storage\":\")(?<!echeck_id:\"){namespace}:([a-z0-9_/]+)", # NOTE because re module requires fixed-length look behind, storage-referencing json *must* use no spaces between "storage":"ns:loc"
        "replace": f"{versioned_namespace}:\\1"
    }))


def dependency_load_tags(ctx: Context, dependencies: dict[str, str]) -> FunctionTag:
    """Assembles dependency information into tag format. Ensures a pack's dependencies
    get processed by lantern load before the primary startup checks for the module itself"""
    dep_tag = FunctionTag()
    manifest = gm4.plugins.manifest.ManifestCacheModel.model_validate(ctx.cache["gm4_manifest"].json)
    for dep_id in dependencies.keys():
        if dep_id not in manifest.modules: # retrieve "gm4_" prefixed id for libraries, which are named "lib_"
            lib = manifest.libraries.get(dep_id)
            if lib is None:
                raise ValueError(f"{dep_id} is not a valid library id")
            dep_id = lib.id
        dep_tag.append(FunctionTag(
            {"values":[
                {"id": f"#load:{dep_id}", "required": False}
            ]}
        ))
    return dep_tag

def versioned_advancements(ctx: Context, ver: Version, targets: list[str], strict:bool=False):
    """Adds versioning to advancements, either strict checks for libraries or load checks for most modules"""
    # NOTE advancements get score checks injected into every criteria
    assemble_value_check = lambda name_field, range_field: { # type:ignore
        "condition": "minecraft:value_check",
        "value": {
            "type": "minecraft:score",
            "target": {
                "type": "minecraft:fixed",
                "name": name_field
            },
            "score": "load.status"
        },
        "range": range_field
    }

    for entry in targets:
        if ":" in entry:
            handle = ctx.data.advancements[entry]
        else:
            handle = ctx.data.advancements[f"{ctx.project_id}:{entry}"]
        for criteria in handle.data["criteria"].values():
            player_conditions = criteria.setdefault("conditions", {}).setdefault("player", [])
            if type(player_conditions) is dict:
                raise ValueError(f"{entry} is using legacy player conditions, which does not support load.status injections.")
            if strict:
                player_conditions.append(assemble_value_check(ctx.project_id, ver.major))
                player_conditions.append(assemble_value_check(f"{ctx.project_id}_minor", ver.minor))
            else:
                player_conditions.append(assemble_value_check(ctx.project_id, {"min": 1}))

def versioned_functions(ctx: Context, ver: Version, targets: list[str]):
    """Adds versioning to functions, either strict checks for libraries or load checks for most modules"""
    ctx.require(
        find_replace(
            data_pack={
                "match": {
                    "functions": [
                        f if ":" in f else f"{ctx.project_id}:{f}" for f in targets
                    ]
                }
            },
            substitute={
                "find": f"{ctx.project_id} load\\.status matches \\d(?: if score {ctx.project_id}_minor load\\.status matches \\d)?",
                "replace": f"{ctx.project_id} load.status matches {ver.major} if score {ctx.project_id}_minor load.status matches {ver.minor}",
            },
        )
    )

def index_echecks(ctx: Context, ver: Version):
    """
    Builds the (versioned) {namespace}:echecks.mcfunction file based on entries in
    #gm4:evaluate_echecks and points the #gm4:evaluate_echecks function tag at it.
    """

    if "gm4:evaluate_echecks" not in ctx.data.function_tags:
        return  # no environment checks defined by this module/library/base.

    # read out defined environment checks and build echecks.mcfunction (introduces active-version checking)
    lines = ["# Auto-generated by gm4/plugins/versioning.py -> index_echecks. Injects active-version checks into environment check entry points.",]
    for entry_point in ctx.data.function_tags['gm4:evaluate_echecks'].data["values"]:

        # parse function tag entry
        # entry point may be a dict instead of a string (e.g. {"required":false, "id":<...>})
        # if that is the case, find the id field and extract the string-form namespace resource locator
        if isinstance(entry_point, dict):
            if ("id" not in entry_point) or (not isinstance(entry_point["id"], str)):
                raise ValueError(f"Failed to parse echeck entry point from 'gm4:evaluate_echecks' entry '{entry_point}'.")
            entry_point = entry_point["id"]

        # strings should be a namespaced resource locator
        if isinstance(entry_point, str):
            if ":" not in entry_point:
                raise ValueError(f"Failed to parse echeck entry point from 'gm4:evaluate_echecks' entry '{entry_point}'.")
            namespace, path = entry_point.split(":", maxsplit=1)

        # unknown type
        else:
            raise ValueError(f"Failed to parse echeck entry point from from 'gm4:evaluate_echecks' entry '{entry_point}' (type '{type(entry_point)}').")

        # append conditional environment check entry point
        # only run check if:
        # - the active version of the library/base matches the version this check was written in (in case this is a versioned library or base)
        # - the environment check has been requested by a module/library/base
        # - the environment check has not yet been evaluated this reload (in-built caching)
        lines.append(
            f"""execute if score {namespace} load.status matches {ver.major} if score {namespace}_minor load.status matches {ver.minor} \\
            if data storage gm4:log echecks.[{{echeck_id:"{namespace}:{path}"}}] \\
            if data storage gm4:log echecks.[{{echeck_id:"{namespace}:{path}",result:{{passed:-1}}}}] \\
            run function {namespace}:{path}"""
        )
    ctx.data.functions[f"{ctx.project_id}:echecks"] = Function(lines)

    # point function tag to echecks.mcfunction
    ctx.data.function_tags["gm4:evaluate_echecks"] = FunctionTag(
        {"values": [f"{ctx.project_id}:echecks"]}
    )


def warn_on_future_version(ctx: Context, dep_id: str, ver: Version):
    """Issues a console warning if the dependency version a module requires is greater than the current version of that dependency"""
    if dep_id == "gm4":
        return # the base version is not in the manifest, tis a special case
    if "lib" in dep_id:
        cache_compound = ctx.cache["gm4_manifest"].json["libraries"]
    else:
        cache_compound = ctx.cache["gm4_manifest"].json["modules"]
    latest_dep_ver = Version(cache_compound.get(dep_id, {}).get("version", '0.0.0'))

    if (latest_dep_ver.major == ver.major and latest_dep_ver.minor < ver.minor) or (latest_dep_ver.major < ver.major): # type: ignore
        message = f"{ctx.project_id} depends on a future version {dep_id} v{ver}, but the latest available is {latest_dep_ver}"
        warnings.warn(message)

def isolated_library(ctx: Context):
    """Generates the #load:load function tag when building libraries in isloation"""
    ctx.cache["currently_building"].json = {"name": ctx.project_name, "id": ctx.project_id, "added_libs": []}
    # load.json tag
    ctx.data.function_tags["load:load"] = FunctionTag({
        "values": [
            f"#load:{ctx.project_id}"
        ]
    })
