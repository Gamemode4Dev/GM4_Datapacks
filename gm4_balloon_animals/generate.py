from pathlib import Path
from typing import List

from beet import Context

from gm4.utils import CSV


def beet_default(ctx: Context):

    # read csv file
    animals =  CSV.from_file(Path('gm4_balloon_animals','animals.csv'))
    
    # figure out numeric ids for animals (easier for mcfunction to work with)
    enumeration: List[str] = []
    rare_start = 0
    for animal in animals:
        if bool(animal['rare']) is True:
            enumeration.append(str(animal['type']))
            continue
        enumeration.insert(0, str(animal['type']))
        rare_start += 1

    # store to meta
    ctx.meta['animals'] = animals
    ctx.meta['enumeration'] = enumeration
    ctx.meta['rare_start'] = rare_start
