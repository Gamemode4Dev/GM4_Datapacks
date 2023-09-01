from beet import Context, subproject

class furnitures:
    def __init__(self, technical_id, display_name, cmd, crafting, block_id="barrier[", sittable=0, dyable=0, wall_only=0, ceiling_only=0, length=1, depth=1, height=1, table=0, scale=1, custom_interaction=0):
        self.technical_id = technical_id
        self.display_name = display_name
        self.cmd = cmd
        self.crafting = crafting
        self.block_id = block_id
        self.sittable = sittable
        self.wall_only = wall_only
        self.ceiling_only = ceiling_only
        self.dyable = dyable
        self.length = length
        self.depth = depth
        self.height = height
        self.table = table
        self.scale = scale
        self.custom_interaction = custom_interaction

# Add new furniture here, technical_id, display_name, cmd, crafting are required in that order, then any other flags can be used to override the default
# crafting should be formatted as (category, item_1,count, item_2,count)
## allowed block_id = "light[level=0," or "light[level=15,", make sure it is formatted exactly like that !!!
def beet_default(ctx: Context):
    furniture_list = []
    trades_list = []
    furniture_list.append(furnitures(
        'wooden_stool_1', 'Wooden Stool', 3420201, ("test1", "stick","3", "iron_ingot","1"), sittable=50))
    furniture_list.append(furnitures(
        'wooden_stool_2', 'Wooden Stool', 3420202, ("test1", "stick","3", "iron_ingot","1"), sittable=50))
    furniture_list.append(furnitures(
        'wooden_chair_1', 'Wooden Chair', 3420203, ("test1", "stick","3", "iron_ingot","1"), sittable=50))
    furniture_list.append(furnitures(
        'wooden_chair_2', 'Wooden Chair', 3420204, ("test1", "stick","3", "iron_ingot","1"), sittable=50))
    furniture_list.append(furnitures(
        'wooden_bench_1', 'Wooden Bench', 3420205, ("test1", "stick","3", "iron_ingot","1"), sittable=50, length=3))
    furniture_list.append(furnitures(
        'wooden_bench_2', 'Wooden Bench', 3420206, ("test1", "stick","3", "iron_ingot","1"), sittable=50, length=3))
    furniture_list.append(furnitures(
        'dyable_armchair_1', 'Cloth Armchair', 3420207, ("test1", "stick","3", "iron_ingot","1"), sittable=50, dyable=1))
    furniture_list.append(furnitures(
        'wooden_3_candle_holder_1', 'Candelabra', 3420208, ("test1", "stick","3", "iron_ingot","1"), block_id="light[level=15,", dyable=1))
    furniture_list.append(furnitures(
        'wooden_5_candle_holder_1', 'Candelabra', 3420209, ("test1", "stick","3", "iron_ingot","1"), block_id="light[level=15,", dyable=1))
    furniture_list.append(furnitures(
        'dyable_stool_1', 'Ottoman', 3420210, ("test1", "stick","3", "iron_ingot","1"), sittable=50, dyable=1))
    furniture_list.append(furnitures(
        'wooden_table_1', 'Wooden Table', 3420211, ("test1", "stick","3", "iron_ingot","1"), table=1))
    furniture_list.append(furnitures(
        'wooden_table_2', 'Wooden Table', 3420212, ("test1", "stick","3", "iron_ingot","1"), table=1))
    furniture_list.append(furnitures(
        'dyable_wooden_table_1', 'Wooden Table with Cloth', 3420213, ("test1", "stick","3", "iron_ingot","1"), dyable=1, table=1))
    furniture_list.append(furnitures(
        'dyable_wooden_sofa_1', 'Wooden Sofa with Cushions', 3420214, ("test1", "stick","3", "iron_ingot","1"), sittable=50, dyable=1, length=3))
    furniture_list.append(furnitures(
        '2x1_log_seat_1', 'Log Bench', 3420215, ("test3","stick","3","iron_ingot","1"), sittable=50, length=2))
    furniture_list.append(furnitures(
        '1x1_log_seat_1', 'Log Seat', 3420216, ("test3","stick","3","iron_ingot","1"), sittable=50))
    furniture_list.append(furnitures(
        'stone_frog_statue', 'Frog Statue', 3420217, ("test1", "stick","3", "iron_ingot","1"), custom_interaction=1))
    furniture_list.append(furnitures(
        'wooden_wall_candle_holder_1', 'Wall Candle', 3420218, ("test1", "stick","3", "iron_ingot","1"), block_id="light[level=15,", dyable=1, wall_only=1))
    furniture_list.append(furnitures(
        'dyable_wooden_chair_1', 'Wooden Chair with Cushions', 3420219, ("test2","stick","3","iron_ingot","1"), sittable=50, dyable=1))
    furniture_list.append(furnitures(
        'gold_5_candle_holder_1', 'Gold Candelabra', 3420220, ("test2","stick","3","iron_ingot","1"), block_id="light[level=15,", dyable=1))
    furniture_list.append(furnitures(
        'gold_3_candle_holder_1', 'Gold Candelabra', 3420221, ("test2","stick","3","iron_ingot","1"), block_id="light[level=15,", dyable=1))
    furniture_list.append(furnitures(
        'iron_5_candle_holder_1', 'Iron Candelabra', 3420222, ("test2","stick","3","iron_ingot","1"), block_id="light[level=15,", dyable=1))
    furniture_list.append(furnitures(
        'iron_3_candle_holder_1', 'Iron Candelabra', 3420223, ("test2","stick","3","iron_ingot","1"), block_id="light[level=15,", dyable=1))
    furniture_list.append(furnitures(
        '2x2_wooden_table_2', 'Wooden Table', 3420224, ("test2","stick","3","iron_ingot","1"), length=2, depth=2, table=1))


    # create furniture loot tables and placement functions
    for furniture_data in furniture_list:
        subproject_config = {
            "data_pack": {
                "load": [
                    {
                        f"data/gm4_furniture/loot_tables/furniture/{furniture_data.technical_id}.json": "data/gm4_furniture/templates/loot_tables/furniture_item_template.json",
                        f"data/gm4_furniture/functions/place/furniture/{furniture_data.technical_id}.mcfunction": "data/gm4_furniture/templates/functions/furniture_place_template.mcfunction",
                    }
                ],
                "render": {
                    "loot_tables": "*",
                    "functions": "*"
                }
            },
            "meta": {
                "technical_id": furniture_data.technical_id,
                "display_name": furniture_data.display_name,
                "cmd": furniture_data.cmd,
                "crafting": furniture_data.crafting,
                "block_id": furniture_data.block_id,
                "sittable": furniture_data.sittable,
                "wall_only": furniture_data.wall_only,
                "ceiling_only": furniture_data.ceiling_only,
                "dyable": furniture_data.dyable,
                "length": furniture_data.length,
                "depth": furniture_data.depth,
                "height": furniture_data.height,
                "table": furniture_data.table,
                "scale": furniture_data.scale,
                "custom_interaction": furniture_data.custom_interaction
            }
        }

        ctx.require(subproject(subproject_config))


    # create a list of all trade data
    # any used trade category should be initiated with a cmd for the used tool, this is done in gm4_furnitures:generate_trades in this datapack
    # for expansions #gm4_furniture:add_categories is called, this should lead to a similar function file.
    for furniture_data in furniture_list:
        trades_list.append("data modify storage gm4_furniture:temp new_trades." + furniture_data.crafting[0] + ".trades append value {cost:[{id:" + furniture_data.crafting[1] + ",Count:" + furniture_data.crafting[2] + "b},{id:" + furniture_data.crafting[3] + ",Count:" + furniture_data.crafting[4] + "b}],technical_id:\"" + furniture_data.technical_id + "\"}")
    trades_list = '\n'.join(trades_list)

    # add a function to add trade data to a storage
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
            "furniture_list": trades_list,
        }
    }

    ctx.require(subproject(subproject_config))
