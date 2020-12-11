# @s = teleportation jammer without fuel
# run from blocks/process_jammer

# refuel 8 minutes of the jammer
scoreboard players add @s gm4_ta_fuel 600

# remove 1 chorus fruit from the dropper
data modify storage gm4_teleportation_anchors:data Items[] set from block ~ ~ ~ Items[{id:"minecraft:chorus_fruit"}]
execute store result storage gm4_teleportation_anchors:data Items[0].Count byte 1 run data get storage gm4_teleportation_anchors:data Items[0].Count 0.99

execute store result score count gm4_et_data run data get storage gm4_teleportation_anchors:data Items[0].Count
data modify block ~ ~ ~ Items append from storage gm4_teleportation_anchors:data Items[0]
