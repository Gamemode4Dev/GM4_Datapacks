from beet import Context, Function, FunctionTag
from beet.contrib.rename_files import rename_files
from beet.contrib.find_replace import find_replace
from gm4.utils import semver_to_dict

def modules(ctx: Context):
    """Assembles version-functions for modules from dependency information:
        - load:{module_name}.json
        - {module_name}:load.mcfunction
        - load:load.json"""
    dependencies: list[str] = ctx.meta.get('gm4', {}).get('required', [])
    lines = ["execute ", ""]

    # {{module_name}}.json tag
    load_tag = dependency_load_tags(ctx, dependencies)
    load_tag.add(f"{ctx.project_id}:load")
    ctx.data.function_tags[f"load:{ctx.project_id}"] = load_tag

    # load.mcfunction
    dependencies.insert(0, f"gm4:{'1.1.0'}") # manually insert base version as dependency
        # NOTE the required base version is always assumed to be the current base version #FIXME

    for dep in dependencies:
        dep_id, ver_str = map(lambda s: s.strip(), dep.split(":"))
        dep_ver = semver_to_dict(ver_str)
        name_default_dict = {"name":"Gamemode 4 Base"} if dep_id == "gm4" else {"name":dep_id}
        dep_name: str = ctx.cache["gm4_manifest"].json["modules"].get(dep_id, name_default_dict)["name"]
        
        if dep_id not in ctx.cache["gm4_manifest"].json["modules"] and dep_id != "gm4":
            dep_id = ctx.cache["gm4_manifest"].json["libraries"].get(dep_id)["id"]
        
        # append to startup check
        lines[0] += f"if score {dep_id} load.status matches {dep_ver['major']} if score {dep_id}_minor load.status matches {dep_ver['minor']}.. "

        # failure logs
        lines.append(f"execute unless score {dep_id} load.status matches {dep_ver['major']} unless score {dep_id}_minor load.status matches {dep_ver['minor']}.. run data modify storage gm4:log queue append value {{type:\"missing\",module:\"{ctx.project_name}\",require:\"{dep_name}\"}}")
        # TODO minor==0 means don't check
    
    # finalize startup check
    module_ver = semver_to_dict(ctx.project_version)
    lines[1] = lines[0] + f"run scoreboard players set {ctx.project_id}_minor load.status {module_ver['minor']}"
    lines[0] += f"run scoreboard players set {ctx.project_id} load.status {module_ver['major']}" # TODO, value and minor version

    lines.append('')
    # start module clocks
    lines.append(f"execute if score {ctx.project_id} load.status matches {module_ver['major']} run function {ctx.project_id}:init")

    # unschedule clocks
    for function in ctx.meta["gm4"].get("schedule_loops", []):
        namespaced_function = f"{ctx.project_id}:{function}" if ":" not in function else function
        lines.append(f"execute unless score {ctx.project_id} load.status matches {module_ver['major']} run schedule clear {namespaced_function}")

    ctx.data.functions[f"{ctx.project_id}:load"] = Function(lines)

    # load.json tag
    ctx.data.function_tags["load:load"] = FunctionTag({
        "values": [
            f"#load:{ctx.project_id}"
        ]
    })

def libraries(ctx: Context):
    """Assembles version-functions for libraries from dependency information:
        - {lib_name}:enumerate.mcfunction
        - {lib_name}:resolve_load.mcfunction
        - load:{lib_name}.json
        - load:{lib_name}/enumerate.json
        - load:{lib_name}/resolve_load.json
        - load:{lib_name}/dependencies.json"""
    dependencies: list[str] = ctx.meta.get('gm4', {}).get('required', [])
    lib_ver = semver_to_dict(ctx.project_version)

    # enumerate.mcfunction
    lines = [
        f"execute if score {ctx.project_id} load.status matches {lib_ver['major']} unless score {ctx.project_id}_minor load.status matches {lib_ver['minor']}.. run scoreboard players set {ctx.project_id}_minor load.status {lib_ver['minor']}",
        "",
    ]

    dep_check_line = "execute "
    for dep in dependencies:
        dep_id, ver_str = map(lambda s: s.strip(), dep.split(":"))
        dep_ver = semver_to_dict(ver_str)

        if dep_id not in ctx.cache["gm4_manifest"].json["modules"]:
            dep_id = ctx.cache["gm4_manifest"].json["libraries"].get(dep_id)["id"]
        
        dep_check_line += f"if score {dep_id} load.status matches {dep_ver['major']} if score {dep_id}_minor load.status matches {dep_ver['minor']}.. "

    dep_check_line += f"unless score {ctx.project_id} load.status matches 1.. run scoreboard players set "

    lines.append(dep_check_line + f"{ctx.project_id}_minor load.status {lib_ver['minor']}")
    lines.append(dep_check_line + f"{ctx.project_id} load.status {lib_ver['major']}")

    ctx.data.functions[f"{ctx.project_id}:enumerate"] = Function(lines) # TODO replacement of actual enumerate

    # resolve_load.mcfunction
    lines = [f"execute if score {ctx.project_id} load.status matches {lib_ver['major']} if score {ctx.project_id}_minor load.status matches {lib_ver['minor']} run function {ctx.project_id}:load"]

    for func in ctx.meta["gm4"].get("schedule_loops", []):
        lines.append(f"execute unless score {ctx.project_id} load.status matches {lib_ver['major']} run schedule clear {ctx.project_id}:{func}")
        lines.append(f"execute unless score {ctx.project_id}_minor load.status matches {lib_ver['minor']} run schedule clear {ctx.project_id}:{func}")
        
    ctx.data.functions[f"{ctx.project_id}:resolve_load"] = Function(lines)

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

    yield # wait for all pack files to load


    # additional version injections
    extra_injections = ctx.meta["gm4"].get("extra_version_injections", {})

    # NOTE functions get version checks replaced onto `load.status` checks
    for entry in extra_injections.get("functions", []):
        handle = ctx.data.functions[f"{ctx.project_id}:{entry}"]
        for i, line in enumerate(handle.lines):
            if "load.status" in line:
                handle.lines[i] = line.replace(f"{ctx.project_id} load.status matches 1", f"{ctx.project_id} load.status matches {lib_ver['major']} if score {ctx.project_id}_minor load.status matches {lib_ver['minor']}")
                # FIXME use contrib replacements to use regex for optional repalcement of minor fields

    # NOTE advancements get score checks injected into every criteria
    for entry in extra_injections.get("advancements", []):
        handle = ctx.data.advancements[f"{ctx.project_id}:{entry}"]
        for criteria in handle.data["criteria"].values():
            player_conditions = criteria.setdefault("conditions", {}).setdefault("player", [])
            player_conditions.append({
                "condition": "minecraft:value_check",
                "value": {
                "type": "minecraft:score",
                "target": {
                    "type": "minecraft:fixed",
                    "name": f"{ctx.project_id}"
                },
                "score": "load.status"
                },
                "range": lib_ver["major"]
            })
            player_conditions.append({
                "condition": "minecraft:value_check",
                "value": {
                "type": "minecraft:score",
                "target": {
                    "type": "minecraft:fixed",
                    "name": f"{ctx.project_id}_minor"
                },
                "score": "load.status"
                },
                "range": lib_ver["minor"]
            })

    # namespace renaming to include version number
    versioned_namespace = f"{ctx.project_id}-{lib_ver['major']}.{lib_ver['minor']}"
    ctx.require(rename_files(data_pack={
        "match":{"functions": "*", "advancements": "*"},
        "find": f"{ctx.project_id}:([a-z_/]+)",
        "replace": f"{versioned_namespace}:\\1"
    }))
    ctx.require(find_replace(data_pack={"match": "*"}, substitute={
        "find": f"(?<!#)(?<!storage ){ctx.project_id}:([a-z0-9_/]+)",
        "replace": f"{versioned_namespace}:\\1"
    }))
    

def dependency_load_tags(ctx: Context, dependencies: list[str]) -> FunctionTag:
    """Assembles dependency information into tag format. Ensures a pack's dependencies
    get processed by lantern load before the primary startup checks for the module itself"""
    dep_tag = FunctionTag()
    for dep in dependencies:
        dep_id, _ = map(lambda s: s.strip(), dep.split(":"))
        if dep_id not in ctx.cache["gm4_manifest"].json["modules"]:
            dep_id = ctx.cache["gm4_manifest"].json["libraries"].get(dep_id)["id"]
        dep_tag.append(FunctionTag(
            {"values":[
                {"id": f"#load:{dep_id}", "required": False}
            ]}
        ))
    return dep_tag