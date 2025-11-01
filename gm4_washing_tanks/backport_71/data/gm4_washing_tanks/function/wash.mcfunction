#@s = water tank liquid_tank_stand with item in first slot
#run from item_fill

conversions = {
    "glass": "glass",
    "glass_pane": "glass_pane",
    "terracotta": "terracotta",
    "wool": "white_wool",
    "bed": "white_bed",
    "carpet": "white_carpet",
    "shulker_box": "shulker_box",
    # "harness": "white_harness" # Added in 1.21.6,
    "bundle": "bundle",
    "candle": "candle"
}

for from_id, to_id in conversions.items():
    execute if items block ~ ~ ~ container.0 f"#gm4_washing_tanks:{from_id}" run function f"gm4_washing_tanks:washing_recipes/{from_id}":
        scoreboard players set $item_value gm4_lt_value -1
        item replace entity 00344d47-0004-0004-0004-000f04ce104d weapon.mainhand from block ~ ~ ~ container.0
        item modify entity 00344d47-0004-0004-0004-000f04ce104d weapon.mainhand {"function":"minecraft:set_item", "item":f"minecraft:{to_id}"}
        function gm4_liquid_tanks:smart_item_fill
        tag @s add gm4_lt_fill

execute if items block ~ ~ ~ container.0 #gm4_washing_tanks:armour[dyed_color] run function gm4_washing_tanks:washing_recipes/armour:
        scoreboard players set $item_value gm4_lt_value -1
        item replace entity 00344d47-0004-0004-0004-000f04ce104d weapon.mainhand from block ~ ~ ~ container.0
        item modify entity 00344d47-0004-0004-0004-000f04ce104d weapon.mainhand {"function":"minecraft:set_components", "components":{"!minecraft:dyed_color":{}}}
        function gm4_liquid_tanks:smart_item_fill
        tag @s add gm4_lt_fill
