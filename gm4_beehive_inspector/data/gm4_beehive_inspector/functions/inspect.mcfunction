# Inspect beehive item
# @s = beehive item
# at @s
# run from main

# store bee count in scoreboard
execute store result score #bees gm4_beehive_insp run data get entity @s Item.tag.BlockEntityTag.Bees

# set nbt if broken without silk touch
execute unless data entity @s Item.tag run data modify entity @s Item.tag set value {BlockEntityTag:{Bees:[]},BlockStateTag:{honey_level:"0"}}

# set bee/honey amount as lore
loot spawn ~ ~-1024 ~ loot gm4_beehive_inspector:technical/lore
execute positioned ~ ~-1024 ~ run data modify entity @s Item.tag.display set from entity @e[type=item,distance=..0.1,limit=1] Item.tag.display
