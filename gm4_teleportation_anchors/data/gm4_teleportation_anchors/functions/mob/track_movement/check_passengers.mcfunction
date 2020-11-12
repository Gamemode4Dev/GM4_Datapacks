# @s = minecart or boat that has passengers
# run from mob/check_movement_type

data modify storage gm4_teleportation_anchors:data UUID set from entity @e[tag=gm4_ta_selected,limit=1,distance=..1] UUID
execute store success score @e[tag=gm4_ta_selected,limit=1,distance=..1] gm4_ta_data run data modify storage gm4_teleportation_anchors:data UUID set from entity @s Passengers[0].UUID
execute if score @e[tag=gm4_ta_selected,limit=1,distance=..1] gm4_ta_data matches 1 store success score @e[tag=gm4_ta_selected,limit=1,distance=..1] gm4_ta_data run data modify storage gm4_teleportation_anchors:data UUID set from entity @s Passengers[1].UUID

tag @e[tag=gm4_ta_selected,limit=1,distance=..1,scores={gm4_ta_data=0}] add gm4_ta_ignore
