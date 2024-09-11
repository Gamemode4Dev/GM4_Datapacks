from pathlib import Path
from typing import List

from beet import Context

from gm4.utils import CSV


def beet_default(ctx: Context):

    # read csv file
    animals =  CSV.from_file(Path('gm4_balloon_animals','animals.csv'))
    
    # sort animals into a common and a rare group
    rare_animals: List[str] = []
    common_animals: List[str] = []
    for animal in animals:
        if animal['rare'] == "TRUE":
            rare_animals.append(str(animal['id']))
            continue
        common_animals.append(str(animal['id']))

    # sort each group alphabetically to ensure .csv-independent id assignments
    rare_animals.sort()
    common_animals.sort()

    # store to meta
    ctx.meta['animals'] = animals
    ctx.meta['enumeration'] = [*common_animals, *rare_animals]
    ctx.meta['rare_start'] = len(common_animals)
