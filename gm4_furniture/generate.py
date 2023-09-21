from beet import Context, subproject
import pandas as pd

def beet_default(ctx: Context):

    trades_init = []
    trades_list = []
    trades_append = []

    # read in the furniture data
    xls = pd.ExcelFile(r'gm4_furniture/furniture_data.xlsx')

    # loop through the different sheets, each sheet hold a different 'category'
    # of furniture which need to be sorted in the furniture_station storage
    for category in xls.sheet_names:

        # skip the sheet if it is the template (TODO: remove the template sheet)
        if category == 'template_sheet':
            continue

        # read trade data from this sheet, this creates the villager trades used
        # inside the furniture station
        tool_cmd = pd.read_excel(xls, category).iloc[0,0]
        trade_data = pd.read_excel(xls, category, skiprows=2, usecols="A:E")
        # call generate_trade_data to build the commands
        new_trades_init,new_trades_list,new_trades_append = generate_trade_data(trade_data, tool_cmd, category)
        # append the trade data to the total list
        trades_init.append(new_trades_init)
        trades_list.append(new_trades_list)
        trades_append.append(new_trades_append)

        # read furniture data from this sheet, and then create the placement function
        # and loot table for each furniture
        furniture_data = pd.read_excel(xls, category, skiprows=2, usecols="E:R")
        generate_furniture_data(ctx, furniture_data, category)


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



def generate_trade_data(trade_data, tool_cmd, category):

    # create a command to make an empty storage called new_trades that holds the category name and tool cmd
    new_trades_init = "data modify storage gm4_furniture:temp new_trades." + category + " set value {cmd:" + tool_cmd + ",trades:[]}"

    # iterate over the rows in the spreadsheet and add the trade data for each furniture to the storage
    new_trades_list = []
    for row in trade_data.index:
        new_trades_list.append("data modify storage gm4_furniture:temp new_trades." + category + ".trades append value {cost:[{id:" + str(trade_data['craft_item_1_id'][row]) + ",Count:" + str(trade_data['craft_item_1_count'][row]) + "b},{id:" + str(trade_data['craft_item_2_id'][row]) + ",Count:" + str(trade_data['craft_item_1_count'][row]) + "b}],furniture_id:\"" + category + "/" + str(trade_data['technical_id'][row]) + "\"}")
    new_trades_list = '\n'.join(new_trades_list)

    # add command to append the main furniture_station storage with the newly created new_trades
    new_trades_append = "data modify storage gm4_furniture:data furniture_station append from storage gm4_furniture:temp new_trades." + category

    # return the created commands
    return(new_trades_init,new_trades_list,new_trades_append)



def generate_furniture_data(ctx, furniture_data, category):

    # create furniture loot tables and placement functions for every furniture in this category
    for row in furniture_data.index:
        # build placement function and loot table for furniture piece
        subproject_config = {
            "data_pack": {
                "load": [
                    {
                        f"data/gm4_furniture/loot_tables/furniture/{category}/{furniture_data['technical_id'][row]}.json": "data/gm4_furniture/templates/loot_tables/furniture_item_template.json",
                        f"data/gm4_furniture/functions/place/furniture/{category}/{furniture_data['technical_id'][row]}.mcfunction": "data/gm4_furniture/templates/functions/furniture_place_template.mcfunction",
                    }
                ],
                "render": {
                    "loot_tables": "*",
                    "functions": "*"
                }
            },
            "meta": {
                "category": category,
                "technical_id": furniture_data['technical_id'][row],
                "display_name": furniture_data['display_name'][row],
                "cmd": str(furniture_data['cmd'][row]),
                "block_id": furniture_data['block_id'][row],
                "sittable": str(furniture_data['sittable'][row]),
                "wall_only": str(int(furniture_data['wall_only'][row])),
                "ceiling_only": str(int(furniture_data['ceiling_only'][row])),
                "dyable": str(int(furniture_data['dyable'][row])),
                "length": str(furniture_data['length'][row]),
                "depth": str(furniture_data['depth'][row]),
                "height": str(furniture_data['height'][row]),
                "table": str(int(furniture_data['table'][row])),
                "scale": str(furniture_data['scale'][row]),
                "custom_interaction": str(int(furniture_data['custom'][row]))
            }
        }

        ctx.require(subproject(subproject_config))
