# executes as the player
# @s = player
# at @s
# run from gm4_rope_ladders:main

tag @s remove gm4_rol_holding_ladder

data modify storage gm4_rope_ladders:temp Player set from entity @s

execute if data storage gm4_rope_ladders:temp Player.SelectedItem.tag.gm4_rope_ladders.item{id:"rope_ladder"} run function gm4_rope_ladders:ladder_detection/raycast/init
