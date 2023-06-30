from beet import Context, Function
from gm4.utils import Version

def beet_default(ctx: Context):
    '''Processes upgrade paths for module data that persists in the world
    between minecraft / module versions, such as the type of
    technical entity used to mark a place.'''

    run_func = Function([], tags=["gm4_upgrade_paths:run"])
    
    upgrade_paths_dirs = [f'{ctx.project_id}:upgrade_paths'] # gm4_bat_grenades:upgrade_paths/... is processed by default
    upgrade_paths_dirs.extend(ctx.meta['gm4'].get('upgrade_paths', [])) # additional upgrade paths to process

    # module:upgrade_paths/run
        # handles checking which paths should be run
    score_holder = ctx.project_id.removeprefix('gm4_')
    newest_version_with_upgrades = 0.0
    for ns, direc in map(lambda a: a.split(':'), upgrade_paths_dirs):
        upgrade_paths_tree = ctx.data[ns].functions.generate_tree(direc)
        if upgrade_paths_tree:
            newest_version_with_upgrades = max(newest_version_with_upgrades, max(map(float, upgrade_paths_tree.keys())))
        for path in upgrade_paths_tree.keys():
            run_func.append(f'execute if score {score_holder} gm4_earliest_version matches ..{Version(path+".0").int_rep() -1} run function {ns}:{direc}/{path}')
    
    if len(run_func.lines) > 0:
        run_func.append(f'execute if score {score_holder} gm4_earliest_version matches ..{Version(str(newest_version_with_upgrades)+".0").int_rep() -1} run scoreboard players add $active_upgrade_paths gm4_data 1')
        run_func.append(f'tag @s remove gm4_running_upgrade_path')
        ctx.data[f'{ctx.project_id}:upgrade_paths/run'] = run_func

def lib(ctx: Context):
    """Runs additional processing to assign libraries a psudo gm4_modules score for comparison"""
    score_holder = ctx.project_id.removeprefix('gm4_')
    ver_int = Version(ctx.project_version).int_rep()
    ctx.data.functions[f'{ctx.project_id}:load'].append(f'execute unless score {score_holder} gm4_earliest_version matches ..{ver_int} run scoreboard players set {score_holder} gm4_earliest_version {ver_int}')

    beet_default(ctx)
