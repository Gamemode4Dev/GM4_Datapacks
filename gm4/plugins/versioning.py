from beet import Context, Function, FunctionTag
from gm4.utils import semver_to_dict

def modules(ctx: Context):
    """Assembles version-functions for modules from dependancy information:
        - load:{module_name}.json
        - {module_name}:load.mcfunction
        - load:load.json"""
    dependancies: list[str] = ctx.meta.get('gm4', {}).get('required', [])
    lines = ["execute ", ""]

    # {{module_name}}.json tag
    load_tag = dependancy_load_tags(ctx, dependancies)
    load_tag.add(f"{ctx.project_id}:load")
    ctx.data.function_tags[f"load:{ctx.project_id}_2"] = load_tag

    # load.mcfunction
    dependancies.insert(0, f"gm4:{'1.1.0'}") # manually insert base version as dependancy
        # NOTE the required base version is always assumed to be the current base version #FIXME

    for dep in dependancies:
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

    ctx.data.functions[f"{ctx.project_id}:load_2"] = Function(lines)

    # load.json tag
    ctx.data.function_tags["load:load_2"] = FunctionTag({
        "values": [
            f"#load:{ctx.project_id}"
        ]
    })

def libraries(ctx: Context):
    """Assembles version-functions for libraries from dependancy information:
        - {lib_name}:enumerate.mcfunction
        - {lib_name}:resolve_load.mcfunction
        - load:{lib_name}.json
        - load:{lib_name}/enumerate.json
        - load:{lib_name}/resolve_load.json
        - load:{lib_name}/dependancies.json"""
    dependancies: list[str] = ctx.meta.get('gm4', {}).get('required', [])
    lib_ver = semver_to_dict(ctx.project_version)
    lib_namespace = f"{ctx.project_id}-{lib_ver['major']}.{lib_ver['minor']}"

    # enumerate.mcfunction
    lines = [
        f"execute if score {ctx.project_id} load.status matches {lib_ver['major']} unless score {ctx.project_id}_minor load.status matches {lib_ver['minor']}.. run scoreboard players set {ctx.project_id}_minor load.status {lib_ver['minor']}",
        "",
    ]

    dep_check_line = "execute "
    for dep in dependancies:
        dep_id, ver_str = map(lambda s: s.strip(), dep.split(":"))
        dep_ver = semver_to_dict(ver_str)

        if dep_id not in ctx.cache["gm4_manifest"].json["modules"]:
            dep_id = ctx.cache["gm4_manifest"].json["libraries"].get(dep_id)["id"]
        
        dep_check_line += f"if score {dep_id} load.status matches {dep_ver['major']} if score {dep_id}_minor load.status matches {dep_ver['minor']}.. "

    dep_check_line += f"unless score {ctx.project_id} load.status matches 1.. run scoreboard players set "

    lines.append(dep_check_line + f"{ctx.project_id}_minor load.status {lib_ver['minor']}")
    lines.append(dep_check_line + f"{ctx.project_id} load.status {lib_ver['major']}")

    ctx.data.functions[f"{lib_namespace}:enumerate_2"] = Function(lines) # TODO replacement of actual enumerate

    # resolve_load.mcfunction
    lines = [f"execute if score {ctx.project_id} load.status matches {lib_ver['major']} if score {ctx.project_id}_minor load.status matches {lib_ver['minor']} run function {lib_namespace}:load"]

    for func in ctx.meta["gm4"].get("schedule_loops", []):
        lines.append(f"execute unless score {ctx.project_id} load.status matches {lib_ver['major']} run schedule clear {lib_namespace}:{func}")
        lines.append(f"execute unless score {ctx.project_id}_minor load.status matches {lib_ver['minor']} run schedule clear {lib_namespace}:{func}")
        
    ctx.data.functions[f"{lib_namespace}:resolve_load_2"] = Function(lines)

    # load/tags {{ lib name }}.json
    ctx.data.function_tags[f"load:{ctx.project_id}_2"] = FunctionTag({
        "values": [
            f"#load:{ctx.project_id}/enumerate",
            f"#load:{ctx.project_id}/resolve_load"
        ]
    })

    # load/tags enumerate.json
    ctx.data.function_tags[f"load:{ctx.project_id}/enumerate_2"] = FunctionTag({
        "values": [
            f"{lib_namespace}:enumerate"
        ]
    })

    # load/tags resolve_load.json
    ctx.data.function_tags[f"load:{ctx.project_id}/resolve_load_2"] = FunctionTag({
        "values": [
            f"{lib_namespace}:resolve_load"
        ]
    })

    # load/tags dependancies.json
    if len(dependancies) > 0:
        dep_tag = dependancy_load_tags(ctx, dependancies)
        ctx.data.function_tags[f"load:{ctx.project_id}/dependancies_2"] = dep_tag
        ctx.data.function_tags[f"load:{ctx.project_id}_2"].prepend(FunctionTag({
            "values": [
                f"#load:{ctx.project_id}/dependancies"
            ]
        }))

    # additional version injections
    # TODO replacements on these fields

def dependancy_load_tags(ctx: Context, dependancies: list[str]) -> FunctionTag:
    """Assembles dependancy information into tag format. Ensures a pack's dependancies
    get processed by lantern load before the primary startup checks for the module itself"""
    dep_tag = FunctionTag()
    for dep in dependancies:
        dep_id, _ = map(lambda s: s.strip(), dep.split(":"))
        if dep_id not in ctx.cache["gm4_manifest"].json["modules"]:
            dep_id = ctx.cache["gm4_manifest"].json["libraries"].get(dep_id)["id"]
        dep_tag.append(FunctionTag(
            {"values":[
                {"id": f"#load:{dep_id}", "required": False}
            ]}
        ))
    return dep_tag