# Forcefully seat a mob on a swing
# @s = Mob to seat
# at @s
# run from gm4_swings:seat/tick

tag @s add gm4_swings.interacter
execute as @e[tag=gm4_swings.swing_seat,predicate=gm4_swings:id_match,distance=..1,limit=1,type=minecraft:item_display] at @s run function gm4_swings:seat/sit/main
tag @s remove gm4_swings.interacter
