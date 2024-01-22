from beet import Context, Function, LootTable
import csv
from typing import Any

names = {}
common = ["Cow", "Pig", "Sheep", "Horse", "Rabbit", "Wolf", "Llama", "Frog"]
rare = ["Fox", "Parrot", "Donkey", "Panda", "Camel", "Goat", "Ocelot"]

def beet_default(ctx: Context):
    read_csv()
    generate_tables(ctx)

def generate_tables(ctx: Context):
    entity: Any
    # fixed 2 trades, unless you want to write generate functions
    # that also have a check for unique animals
    for i in range(1, 3):
        pools: Any = []
        entries: Any = []
        for entity in names:
            for name in names[entity]:

                # set_nbt function
                functions = [{
                    "function": "minecraft:set_nbt",
                    "tag": f"{{gm4_balloon_animals:{{animal:{i}b,trade:{i}b}}}}"
                },{
                    "function": "minecraft:set_name",
                    "entity": "this",
                    "name":
                        {
                            "text": entity,
                            "italic": False
                        }
                },{
                    "function": "minecraft:set_lore",
                    "entity": "this",
                    "lore": [
                        {
                            "text": name,
                            "color": "gray"
                        }
                    ]
                }]

                if entity in common:
                    score_range: Any = {
                        "min": 0,
                        "max": 2
                    }
                    index = common.index(entity)
                if entity in rare:
                    score_range: Any = {
                        "min": 3,
                        "max": 9
                    }
                    index = rare.index(entity)

                conditions = [{
                    "condition": "minecraft:value_check",
                    "value": {
                        "type": "minecraft:score",
                        "target": {
                            "type": "minecraft:fixed",
                            "name": f"$a{i}_rare_calc"
                        },
                        "score": "gm4_balloon_animals_data"
                    },
                    "range": score_range
                }, {
                    "condition": "minecraft:value_check",
                    "value": {
                        "type": "minecraft:score",
                        "target": {
                            "type": "minecraft:fixed",
                            "name": f"$a{i}_choice"
                        },
                        "score": "gm4_balloon_animals_data"
                    },
                    "range": index
                }]
                
                entry: Any = {
                    "type": "minecraft:item",
                    "name": "minecraft:lead",
                    "functions": functions,
                    "conditions": conditions
                }
                entries.append(entry)
        
        pool: Any = {
            "rolls": 1,
            "entries": entries
        }
        pools.append(pool)

        ctx.data[f"gm4_balloon_animals:trade_{i}/lead"] = LootTable({
            "pools": pools
        })




def read_csv():
    # read csv file
    with open('gm4_balloon_animals/names.csv', mode = 'r') as file:
        csv_file = csv.reader(file)
    
        # skip first 3 rows
        next(csv_file)
        next(csv_file)
        next(csv_file)
        
        for row in csv_file:
            row = list(filter(None, row))
            entity = row[0]
            names[entity] = row[0:]
