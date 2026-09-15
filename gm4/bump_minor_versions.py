## NOTE: THIS IS NOT A PLUGIN

"""
Manually run to bump minor versions of
- base
- all modules
- all libraries
And the listed dependency versions

This is to be used when we branch the repo for a new minecraft update.

YOU WANT TO CHECK THE OUTPUT
"""
# `pip install ruamel.yaml`

import re
from pathlib import Path

import ruamel.yaml
yaml = ruamel.yaml.YAML()
yaml.indent(mapping=2, sequence=4, offset=2)
yaml.width = 10000
yaml.representer.add_representer(
    type(None),
    lambda self, data: self.represent_scalar('tag:yaml.org,2002:null', 'null')
)


def get_file_locations() -> list[str]:
    to_update = re.compile(r"(base|gm4_.+|lib_.+)")
    repo_path = Path(".")
    paths: list[str] = []
    for pack in repo_path.iterdir():
        if not to_update.search(str(pack)):
            continue
        paths.append(str(pack) + "/beet.yaml")
    return paths


def update_version(path: str):
    with open(path, 'r+', encoding='utf-8') as file:
        beet_yaml = yaml.load(file)
        version = beet_yaml['version']
        major, minor, patch = version.split('.')
        new_version = f"{major}.{int(minor) + 1}.{patch}"
        beet_yaml['version'] = new_version
        update_dependencies(path.removesuffix("/beet.yaml"),new_version.replace("X","0"))
        file.seek(0)
        yaml.dump(beet_yaml, file)
        file.truncate()


def get_version(pack: str) -> str:
    with open(f"{pack}/beet.yaml", 'r', encoding='utf-8') as file:
        beet_yaml = yaml.load(file)
        return beet_yaml['version']


def update_dependencies(pack: str, new_version: str):
    for path in get_file_locations():
        with open(path, 'r+', encoding='utf-8') as file:
            beet_yaml = yaml.load(file)
            try:
                dependencies = beet_yaml['meta']['gm4']['versioning']['required']
                for key,value in beet_yaml['meta']['gm4']['versioning']['required'].items():
                    if key != pack:
                        continue
                    beet_yaml['meta']['gm4']['versioning']['required'][key] = new_version
                    file.seek(0)
                    yaml.dump(beet_yaml, file)
                    file.truncate()
            except:
                pass

for path in get_file_locations():
    update_version(path)
