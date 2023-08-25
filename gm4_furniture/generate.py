from beet import Context, subproject


class furnitures:
    def __init__(self, technical_id, display_name, cmd, block_id="barrier", sittable=0, dyable=0, wall_only=0, length=1, depth=1, height=1, table=0):
        self.technical_id = technical_id
        self.display_name = display_name
        self.cmd = cmd
        self.block_id = block_id
        self.sittable = sittable
        self.wall_only = wall_only
        self.dyable = dyable
        self.length = length
        self.depth = depth
        self.height = height
        self.table = table


def beet_default(ctx: Context):

    furniture_list = []
    furniture_list.append(furnitures(
        'wooden_stool_1', 'Wooden Stool', 3420201, sittable=50))
    furniture_list.append(furnitures(
        'wooden_stool_2', 'Wooden Stool', 3420202, sittable=50))
    furniture_list.append(furnitures(
        'wooden_chair_1', 'Wooden Chair', 3420203, sittable=50))
    furniture_list.append(furnitures(
        'wooden_chair_2', 'Wooden Chair', 3420204, sittable=50))
    furniture_list.append(furnitures(
        'wooden_bench_1', 'Wooden Bench', 3420205, sittable=50, length=3))
    furniture_list.append(furnitures(
        'wooden_bench_2', 'Wooden Bench', 3420206, sittable=50, length=3))
    furniture_list.append(furnitures(
        'dyable_armchair_1', 'Cloth Armchair', 3420207, sittable=1, dyable=1))
    furniture_list.append(furnitures(
        'wooden_candelabra_1', 'Candelabra', 3420208, block_id="light[level=15]", dyable=1))
    furniture_list.append(furnitures(
        'wooden_candelabra_2', 'Candelabra', 3420209, block_id="light[level=15]", dyable=1))
    furniture_list.append(furnitures(
        'dyable_stool_1', 'Ottoman', 3420210, sittable=50, dyable=1))
    furniture_list.append(furnitures(
        'wooden_table_1', 'Wooden Table', 3420211, table=1))
    furniture_list.append(furnitures(
        'wooden_table_2', 'Wooden Table', 3420212, table=1))
    furniture_list.append(furnitures(
        'dyable_wooden_table_1', 'Wooden Table with Cloth', 3420213, dyable=1, table=1))
    
    
    for furniture_data in furniture_list:
        subproject_config = {
            "data_pack": {
                "load": [
                    {
                        f"data/gm4_furniture/loot_tables/furniture/{furniture_data.technical_id}.json": "data/gm4_furniture/templates/loot_tables/template.json",
                        f"data/gm4_furniture/functions/place/furniture/{furniture_data.technical_id}.mcfunction": "data/gm4_furniture/templates/functions/template.mcfunction",
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
                "block_id": furniture_data.block_id,
                "sittable": furniture_data.sittable,
                "wall_only": furniture_data.wall_only,
                "dyable": furniture_data.dyable,
                "length": furniture_data.length,
                "depth": furniture_data.depth,
                "height": furniture_data.height,
                "table": furniture_data.table,
                
            }
        }

        ctx.require(subproject(subproject_config))
