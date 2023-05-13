# @s = teleportation jammer with antenna and at least one layer of pyramid
# run from blocks/process_jammer

scoreboard players remove @s[scores={gm4_ta_fuel=1..}] gm4_ta_fuel 1
execute unless score @s gm4_ta_fuel matches 1.. if data block ~ ~ ~ Items[{id:"minecraft:chorus_fruit"}] run function gm4_teleportation_anchors:blocks/jammer/load_fuel

execute if score @s gm4_ta_fuel matches 1.. run function gm4_teleportation_anchors:blocks/jammer/active
