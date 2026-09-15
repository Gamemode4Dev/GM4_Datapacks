from beet import Context, Function
import math
from pathlib import Path
from gm4.utils import CSV, CSVRow
from itertools import product 

def beet_default(ctx: Context):
    """
        reads csv to ctx.meta for hooked_entity/select_type.mcfunction
    """
    entity_list =  CSV.from_file(Path('gm4_reeling_rods','entities.csv'))
    dismountable_entities: list[CSVRow] = []
    non_dismountable_entities: list[CSVRow] = []
    for entity_type in entity_list:
        if entity_type['can_dismount'].as_bool():
            dismountable_entities.append(entity_type)
            continue
        non_dismountable_entities.append(entity_type)
    ctx.meta['dismountable_entities'] = dismountable_entities
    ctx.meta['non_dismountable_entities'] = non_dismountable_entities
