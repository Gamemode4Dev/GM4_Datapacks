from beet import Context, Function, FunctionTag
from gm4.utils import Version

def beet_default(ctx: Context):
    '''Processes upgrade paths for module data that persists in the world
    between minecraft / module versions, such as item names or the type of
    technical entity used to mark a place.'''
    print(f"RUNNING UPGRADE PATHS {ctx.project_id}")

    yield # wait for pack files to load
        # BUG so uh we can't create files after a yield? Is that right? Is our pipeline that broken?
    run_func = ctx.data[f'{ctx.project_id}:upgrade_paths/run'] = Function([], tags=["gm4_upgrade_paths:run"])
    
    upgrade_paths_dirs = [f'{ctx.project_id}:upgrade_paths'] # gm4_bat_grenades:upgrade_paths/... is processed by default

    # additional upgrade paths to process
    upgrade_paths_dirs.extend(ctx.meta['gm4'].get('upgrade_paths', []))

    # module:upgrade_paths/run
        # handles checking which paths should be run
    score_holder = ctx.project_id.removeprefix('gm4_')

    for ns, direc in map(lambda a: a.split(':'), upgrade_paths_dirs):
        upgrade_paths_tree = ctx.data[ns].functions.generate_tree(direc)
        for path in upgrade_paths_tree.keys():
            run_func.append(f'execute if score {score_holder} gm4_earliest_version matches ..{Version(path+".0").int_rep() -1} run function {ns}:{direc}/{path}')
    
    print(ctx.data.functions)

    # #gm4_upgrade_paths:run tag
    # ctx.data.function_tags['gm4_upgrade_paths:run']
    

def test(ctx: Context):
    print("TEST PASS")
