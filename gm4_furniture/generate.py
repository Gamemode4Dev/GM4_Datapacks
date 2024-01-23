from beet import Context, subproject
from pathlib import Path
from gm4.utils import CSV

def beet_default(ctx: Context):

    trades_init = []
    trades_list = []
    trades_append = []

    furniture_sets = {}

    for path in sorted(Path('gm4_furniture/raw_data/furniture_set').glob('*.csv')):
        furniture_sets[path.stem] = CSV.from_file(path)

    tool_cmds = CSV.from_file(Path('gm4_furniture/raw_data/tool_cmds.csv'))

    # loop through the different sheets, each sheet hold a different 'set_name'
    # of furniture which need to be sorted in the furniture_station storage
    for set_name,furniture_set in furniture_sets.items():

        # read trade data from this sheet, this creates the villager trades used
        # inside the furniture station
        tool_cmd = tool_cmds.find_row(set_name , 0)['tool_cmd']

        # call generate_trade_data to build the commands
        new_trades_init,new_trades_list,new_trades_append = generate_trade_data(furniture_set, tool_cmd, set_name)
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
                    f"data/gm4_furniture/functions/generate_trades.mcfunction": "data/gm4_furniture/templates/functions/crafting_template.mcfunction",
                }
            ],
            "render": {
                "functions": "*"
            }
        },
        "meta": {
            "trades_init": trades_init,
            "trades_list": trades_list,
            "trades_append": trades_append,
        }
    }

    ctx.require(subproject(subproject_config))



def generate_trade_data(furniture_set, tool_cmd, set_name):

    # create a command to make an empty storage called new_trades that holds the set_name name and tool cmd
    new_trades_init = "data modify storage gm4_furniture:temp new_trades." + set_name + " set value {cmd:" + tool_cmd + ",trades:[]}"

    # iterate over the rows in the spreadsheet and add the trade data for each furniture to the storage
    new_trades_list = []
    for row in furniture_set:
        new_trades_list.append("data modify storage gm4_furniture:temp new_trades." + set_name + ".trades append value {cost:[{id:" + row['craft_item_1_id'] + ",Count:" + row['craft_item_1_count'] + "b},{id:" + row['craft_item_2_id'] + ",Count:" + row['craft_item_2_count'] + "b}],result:{furniture_id:\"" + set_name + "/" + row['technical_id'] + "\",Count:" + row['craft_result_count'] + "}}")
    new_trades_list = '\n'.join(new_trades_list)

    # add command to append the main furniture_station storage with the newly created new_trades
    new_trades_append = "data modify storage gm4_furniture:data furniture_station append from storage gm4_furniture:temp new_trades." + set_name

    # return the created commands
    return(new_trades_init,new_trades_list,new_trades_append)



def generate_furniture_data(ctx, furniture_set, set_name):

    # create furniture loot tables and placement functions for every furniture in this category
    for row in furniture_set:
        # build placement function and loot table for furniture piece
        subproject_config = {
            "data_pack": {
                "load": [
                    {
                        f"data/gm4_furniture/loot_tables/furniture/{set_name}/{row['technical_id']}.json": "data/gm4_furniture/templates/loot_tables/furniture_item_template.json",
                        f"data/gm4_furniture/functions/place/furniture/{set_name}/{row['technical_id']}.mcfunction": "data/gm4_furniture/templates/functions/furniture_place_template.mcfunction",
                    }
                ],
                "render": {
                    "loot_tables": "*",
                    "functions": "*"
                }
            },
            "meta": {
                "category": set_name,
                "technical_id": row['technical_id'],
                "display_name": row['display_name'],
                "cmd": row['cmd'],
                "block_id": row['block_id'],
                "sittable": row['sittable'],
                "wall_only": str(int(row['wall_only'] == 'TRUE')),
                "ceiling_only": str(int(row['ceiling_only'] == 'TRUE')),
                "dyable": str(int(row['dyable'] == 'TRUE')),
                "length": row['length'],
                "depth": row['depth'],
                "height": row['height'],
                "table": str(int(row['table'] == 'TRUE')),
                "scale": row['scale'],
                "allow_diagonal_placement": str(int(row['diag'] == 'TRUE')),
                "custom_interaction": str(int(row['custom'] == 'TRUE'))
            }
        }

        ctx.require(subproject(subproject_config))
