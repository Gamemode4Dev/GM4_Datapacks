from beet import Context, subproject, Cache
from pathlib import Path
from typing import Any
from gm4.utils import CSV
from gm4.plugins.resource_pack import ContainerGuiOptions, GuiFont

def beet_default(ctx: Context):

    trades_init = []
    trades_list = []
    trades_append = []

    furniture_sets = {}

    for path in sorted(Path('gm4_furniture/raw_data/furniture_set').glob('*.csv')):
        furniture_sets[path.stem] = CSV.from_file(path)

    # loop through the different sheets, each sheet hold a different 'set_name'
    # of furniture which need to be sorted in the furniture_station storage
    for set_name,furniture_set in furniture_sets.items():

        # call generate_trade_data to build the commands
        new_trades_init,new_trades_list,new_trades_append = generate_trade_data(ctx, furniture_set, set_name)
        # append the trade data to the total list
        trades_init.append(new_trades_init)
        trades_list.append(new_trades_list)
        trades_append.append(new_trades_append)

        # read furniture data from this sheet, and then create the placement function
        # and loot table for each furniture
        generate_furniture_data(ctx, furniture_set, set_name)


    # build the trade data commands
    trades_init = '\n'.join(trades_init)
    trades_list = '\n'.join(trades_list)
    trades_append = '\n'.join(trades_append)
    # build the trade data function from crafting_template
    subproject_config = {
        "data_pack": {
            "load": [
                {
                    f"data/gm4_furniture/function/generate_trades.mcfunction": "data/gm4_furniture/template/function/crafting_template.mcfunction",
                }
            ],
            "render": {
                "function": "*"
            }
        },
        "meta": {
            "trades_init": trades_init,
            "trades_list": trades_list,
            "trades_append": trades_append,
        }
    }

    ctx.require(subproject(subproject_config))



def generate_trade_data(ctx, furniture_set, set_name):

    # create a command to make an empty storage called new_trades that holds the set_name name and tool cmd
    new_trades_init = "data modify storage gm4_furniture:temp new_trades." + set_name + " set value {\"minecraft:item_model\":\"gm4_furniture:set_tool/" + set_name + "\",trades:[]}"

    # iterate over the rows in the spreadsheet and add the trade data for each furniture to the storage
    new_trades_list = []
    for row in furniture_set:
        new_trades_list.append("data modify storage gm4_furniture:temp new_trades." + set_name + ".trades append value {cost:[{id:" + row['craft_item_1_id'] + ",count:" + row['craft_item_1_count'] + "b},{id:" + row['craft_item_2_id'] + ",count:" + row['craft_item_2_count'] + "b}],result:{furniture_id:\"" + set_name + "/" + row['technical_id'] + "\",count:" + row['craft_result_count'] + "}}")
    new_trades_list = '\n'.join(new_trades_list)

    # add command to append the main furniture_station storage with the newly created new_trades
    new_trades_append = "data modify storage gm4_furniture:data furniture_station append from storage gm4_furniture:temp new_trades." + set_name

    # return the created commands
    return(new_trades_init,new_trades_list,new_trades_append)



def generate_furniture_data(ctx, furniture_set, set_name):

    # create furniture loot tables and placement functions for every furniture in this category
    for row in furniture_set:

        # set item model
        item_model = "gm4_furniture:" + set_name + "/" + row['technical_id'].replace(".","/")

        # build placement function and loot table for furniture piece
        subproject_config = {
            "data_pack": {
                "load": [
                    {
                        f"data/gm4_furniture/loot_table/furniture/{set_name}/{row['technical_id']}.json": "data/gm4_furniture/template/loot_table/furniture_item_template.json",
                        f"data/gm4_furniture/function/place/furniture/{set_name}/{row['technical_id']}.mcfunction": "data/gm4_furniture/template/function/furniture_place_template.mcfunction",
                    }
                ],
                "render": {
                    "loot_table": "*",
                    "function": "*"
                }
            },
            "meta": {
                "category": set_name,
                "technical_id": row['technical_id'],
                "display_name": row['display_name'],
                "item_model": item_model,
                "block_id": row['block_id'],
                "sittable": row['sittable'],
                "wall_only": str(int(row['wall_only'] == 'TRUE')),
                "ceiling_only": str(int(row['ceiling_only'] == 'TRUE')),
                "dyeable": str(int(row['dyeable'] == 'TRUE')),
                "length": row['length'],
                "depth": row['depth'],
                "height": row['height'],
                "table": str(int(row['table'] == 'TRUE')),
                "scale": row['scale'],
                "allow_diagonal_placement": str(int(row['diag'] == 'TRUE')),
                "custom_interaction": str(int(row['custom_interaction'] == 'TRUE')),
                "custom_placement" : str(int(row['custom_placement'] == 'TRUE'))
            }
        }

        ctx.require(subproject(subproject_config))


class FurnitureStationGui(ContainerGuiOptions):
    container = "furniture_station"

    def process(self, config: GuiFont, counter_cache: Cache) -> tuple[str, list[dict[str, Any]]]:
        u1 = self.next_unicode(counter_cache)
        u2 = self.next_unicode(counter_cache)
        return "\u8020"+u1+"\u8100"+u2+"\u8021", [
            {
                "type": "bitmap",
                "file": config.texture+"_1.png",
                "ascent": 20,
                "height": 256,
                "chars": [u1]
            },
            {
                "type": "bitmap",
                "file": config.texture+"_2.png",
                "ascent": 20,
                "height": 256,
                "chars": [u2]
            }
        ]
