from beet import Context, subproject
from pathlib import Path
import yaml

def module(ctx: Context):
    """Extends the module.yaml project config within a pipeline without losing necessary parent project context"""
    with open(Path("module.yaml")) as f:
        conf = yaml.safe_load(f)
    for p in ['id', 'name', 'version']:
        conf[p] = ctx.__getattribute__(f'project_{p}')
    conf['meta'] = {**ctx.meta, **conf['meta']} # module.yaml meta prioritized
    ctx.require(subproject(conf))
