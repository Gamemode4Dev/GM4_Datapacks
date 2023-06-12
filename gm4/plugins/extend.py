from beet import Context, subproject
from pathlib import Path
import yaml

def _generate_extend_plugin(name: str):
    def plugin(ctx: Context):
        """Extends the specified project config within a pipeline without losing necessary parent context
            - necessary to run "boilerplate" plugins in the middle of a build pipeline"""
        with open(Path(name)) as f:
            conf = yaml.safe_load(f)
        with ctx.override(**conf.get('meta', {})):
            for process in conf['pipeline']: # manually call each pipeline entry as if it were in the parent config
                if type(process) is dict: 
                    process = subproject({"pipeline": [process], "meta": conf.get('meta', {})})
                # else, it's a plugin name str
                ctx.require(process)
    return plugin

library = _generate_extend_plugin('library.yaml')
module = _generate_extend_plugin('module.yaml')
