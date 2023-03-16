from beet import Context, Function
from gm4.utils import semver_to_dict

def assemble_load(ctx: Context):
    """Assembles the module load.mcfunction from dependancy information"""
    dependancies: list[str] = ctx.meta.get('gm4', {}).get('required', [])
    lines = ["execute ", ""]

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

    ctx.data.functions[f"{ctx.project_id}:load_2"] = Function(lines) # TODO tags=

# TODO libs need to be named by their gm4_brewing name
def libraries(ctx: Context):
    """Assembles version-functions for libraries from dependancy information"""
    lib_ver = semver_to_dict(ctx.project_version)

    # enumerate.mcfunction
    lines = [
        f"execute if score {ctx.project_id} load.status matches {lib_ver['major']} unless score {ctx.project_id}_minor load.status matches {lib_ver['minor']}.. run scoreboard players set {ctx.project_id}_minor load.status {lib_ver['minor']}",
        "",
    ]

    dependancies: list[str] = ctx.meta.get('gm4', {}).get('required', [])
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

    lib_namespace = f"{ctx.project_id}-{lib_ver['major']}.{lib_ver['minor']}"
    ctx.data.functions[f"{lib_namespace}:enumerate_2"] = Function(lines) # TODO replacement of actual enumerate

    # resolve_load.mcfunction
    ctx.data.functions[f"{lib_namespace}:resolve_load_2"] = Function(
        f"execute if score {ctx.project_id} load.status matches {lib_ver['major']} if score {ctx.project_id}_minor load.status matches {lib_ver['minor']} run function {lib_namespace}:load"
    )
    # TODO unscheduling of clocks when load should fail. 
        # This is inconsistent between modules :/