# Update the swing's length
# @s = Item display, swing main body
# at @s
# run from gm4_swings:swing/shorten

$data merge entity @s {width:$(length).5,height:-$(length).5,item:{components:{"minecraft:custom_model_data":{floats:[$(length)]}}}}

scoreboard players operation $id gm4_swings.id = @s gm4_swings.id
$execute rotated as @s as @e[tag=gm4_swings.swing_seat,predicate=gm4_swings:id_match,distance=..10,limit=1,type=minecraft:item_display] positioned ^ ^-$(length) ^ positioned ^ ^-0.5 ^ run function gm4_swings:seat/move/tp
