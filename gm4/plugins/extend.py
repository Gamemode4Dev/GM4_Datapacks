from beet import Context, subproject
from pathlib import Path
import yaml

def _generate_extend_plugin(name: str):
    def plugin(ctx: Context):
        """Extends the specified project config within a pipeline without losing necessary parent context
            - necessary to run "boilerplate" plugins in the middle of a build pipeline"""
        with open(Path(name)) as f:
            conf = yaml.safe_load(f)
        for p in ['id', 'name', 'version']:
            conf[p] = ctx.__getattribute__(f'project_{p}')
        conf['meta'] = {**ctx.meta, **conf.get('meta', {})} # extended-yaml meta prioritized over parent
        ctx.require(subproject(conf))
    return plugin

library = _generate_extend_plugin('library.yaml')
module = _generate_extend_plugin('module.yaml')
