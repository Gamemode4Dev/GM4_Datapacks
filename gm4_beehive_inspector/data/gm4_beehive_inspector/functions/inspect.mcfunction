# @s = beehive item, Age:0
# at @s
# run from find_item

# store bee count in scoreboard
execute store result score $bees gm4_beehive_insp run data get entity @s Item.components."minecraft:bees"

# set component if broken without silk touch
execute unless items entity @s contents *[block_state] run data modify entity @s Item.components."minecraft:block_state" set value {honey_level:"0"}

# set bee/honey amount as lore
item modify entity @s contents gm4_beehive_inspector:set_tooltips
