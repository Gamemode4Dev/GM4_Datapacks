# run from item_fill
# @s = liquid tank at @s

concretes_colors = (
    "black",
    "blue",
    "brown",
    "cyan",
    "gray",
    "green",
    "light_blue",
    "light_gray",
    "lime",
    "magenta",
    "orange",
    "pink",
    "purple",
    "red",
    "white",
    "yellow"
)
for color in concretes_colors:
    execute if items block ~ ~ ~ container.0 f"minecraft:{color}_concrete_powder" run function f"gm4_cement_mixers:item_fill/{color}_concrete":
        scoreboard players set $item_value gm4_lt_value -1
        item replace entity 00344d47-0004-0004-0004-000f04ce104d weapon.mainhand with f"minecraft:{color}_concrete"
        function gm4_liquid_tanks:smart_item_fill
        tag @s add gm4_lt_fill

item_tag gm4_cement_mixers:dirt {
    "values": [
        "minecraft:dirt",
        "minecraft:coarse_dirt",
        "minecraft:rooted_dirt"
    ]
}
execute if items block ~ ~ ~ container.0 #gm4_cement_mixers:dirt run function gm4_cement_mixers:item_fill/mud:
    scoreboard players set $item_value gm4_lt_value -1
    item replace entity 00344d47-0004-0004-0004-000f04ce104d weapon.mainhand with minecraft:mud
    function gm4_liquid_tanks:smart_item_fill
    tag @s add gm4_lt_fill
