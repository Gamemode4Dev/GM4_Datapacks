import json

data = {

    "snowy": ["snowy_taiga", "snowy_beach", "snowy_tundra", "snowy_mountains", "snowy_taiga_hills", "snowy_taiga_mountains", "frozen_river", "ice_spikes"],

    "cold": ["mountains", "gravelly_mountains", "wooded_mountains", "modified_gravelly_mountains", "taiga", "taiga_hills", "taiga_mountains", "giant_tree_taiga", "giant_spruce_taiga", "giant_tree_taiga_hills", "giant_spruce_taiga_hills"],

    "lush": ["plains", "sunflower_plains", "forest", "flower_forest", "birch_forest", "birch_forest_hills", "tall_birch_forest", "tall_birch_hills", "dark_forest", "dark_forest_hills", "swamp", "swamp_hills", "jungle", "modified_jungle", "jungle_edge", "modified_jungle_edge", "bamboo_jungle", "bamboo_jungle_hills", "river", "beach", "mushroom_fields", "mushroom_field_shore", "the_end", "small_end_islands", "end_midlands", "end_highlands", "end_barrens"],

    "warm": ["desert", "desert_hills", "desert_lakes", "savanna", "savanna_plateau", "shattered_savanna", "shattered_savanna_plateau", "badlands", "badlands_plateau", "eroded_badlands", "wooded_badlands_plateau", "modified_badlands_plateau", "modified_wooded_badlands_plateau", "nether"],

    "ocean": ["ocean", "cold_ocean", "deep_ocean", "warm_ocean", "frozen_ocean", "lukewarm_ocean", "deep_cold_ocean", "deep_warm_ocean", "deep_frozen_ocean", "deep_lukewarm_ocean"],

    "desert": ["desert", "desert_hills", "desert_lakes"],

    "badlands": ["badlands", "badlands_plateau", "eroded_badlands", "wooded_badlands_plateau", "modified_badlands_plateau", "modified_wooded_badlands_plateau"],

    "forest": ["forest", "dark_forest", "dark_forest_hills", "birch_forest", "birch_forest_hills", "flower_forest", "tall_birch_forest", "taiga", "taiga_hills", "taiga_mountains", "snowy_taiga", "snowy_taiga_hills", "snowy_taiga_mountains", "giant_tree_taiga", "giant_spruce_taiga", "giant_tree_taiga_hills", "giant_spruce_taiga_hills"],

    "plains": ["plains", "snowy_tundra"],

    "river": ["river", "frozen_river"],

    "beach": ["stone_shore", "beach", "snowy_beach"]
}

out = {"pools": [
    {"rolls": 1,
    "entries": [
        {"type": "minecraft:item",
        "name": "minecraft:stick",
        "functions": []}
    ]}
]}

for key, biomes in data.items():
    function = {"function": "minecraft:set_nbt",
                "tag": "{gm4_orbis:{"+key+":1b}}",
                "conditions": [
                    {"condition": "minecraft:alternative",
                    "terms": []}
                ]}
    for biome in biomes:
        term = {"condition": "minecraft:location_check",
                "predicate": {
                    "biome": "minecraft:"+biome
                }}
        function["conditions"][0]["terms"].append(term)
    out["pools"][0]["entries"][0]["functions"].append(function)

with open('detect_biome.json', 'w') as f:
    json.dump(out, f, indent=2)
    f.write("\n")
