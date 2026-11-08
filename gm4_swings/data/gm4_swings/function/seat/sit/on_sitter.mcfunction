# Setup the entity
# @s = Entity, about to be sat on the swing
# at swing seat
# run from gm4_swings:seat/sit/main

# only tag if player
tag @s[type=minecraft:player] add gm4_swings.swing_sitter

# grab motion
data modify storage gm4_swings:data motion set from entity @s Motion

# dismount
ride @s dismount

# check if player
execute store result score $is_player gm4_swings.dummy if entity @s[type=minecraft:player]
