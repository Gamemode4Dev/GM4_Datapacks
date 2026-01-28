from beet import Context, Function
import math
from pathlib import Path
from gm4.utils import CSV, CSVRow
from itertools import product 

def beet_default(ctx: Context):
    """
        - generates set_lookup_table.mcfunction
        - reads csv to ctx.meta for hooked_entity/select_type.mcfunction
    """
    create_lookup_file(ctx)

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

def create_lookup_file(ctx: Context):
    ctx.data["gm4_reeling_rods:set_lookup_table"] = Function(  
        [  
            f"scoreboard players set ${key} gm4_reeling_rods.lookup {value}"  
            for key, value in {  
                (x**2 + y**2 + z**2): int(  
                    100 * (0.08 * math.sqrt(math.sqrt(x**2 + y**2 + z**2)))  
                )  
                for x, y, z in product(range(0, 34), range(0, 34), range(0, 34))  
            }.items() if math.sqrt(key) <= 33
        ]
    )
