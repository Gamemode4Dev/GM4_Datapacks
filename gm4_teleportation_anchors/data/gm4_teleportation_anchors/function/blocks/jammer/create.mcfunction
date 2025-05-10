# @s = custom crafter with teleportation jammer recipe
# run from recipe_check

data merge storage gm4_custom_crafters:temp/crafter {Items:[],CustomName:{"color":"dark_purple","translate":"block.gm4.teleportation_jammer","fallback":"Teleportation Jammer"}}
data merge entity @s {CustomName:"gm4_teleportation_jammer",equipment:{head:{id:"purpur_pillar",count:1,components:{"minecraft:custom_model_data":"block/teleportation_jammer"}}}}
playsound minecraft:block.chorus_flower.death block @a[distance=..8] ~ ~ ~ 100 1.3
playsound minecraft:block.beacon.power_select block @a[distance=..8] ~ ~ ~ 0.3 0.3
tag @s add gm4_teleportation_jammer
tag @s remove gm4_custom_crafter

# assign id
execute store result score @s gm4_ta_jam_id run data get entity @s UUID[3]

advancement grant @a[distance=..4,gamemode=!spectator] only gm4:teleportation_anchors_jammer
