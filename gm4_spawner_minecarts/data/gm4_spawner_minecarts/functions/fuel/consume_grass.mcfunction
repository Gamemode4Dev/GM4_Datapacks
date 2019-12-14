#@s = flower_checker area_effect_cloud inside a consumable block
#run from check_for_flower

scoreboard players add @e[type=spawner_minecart,tag=gm4_processing_spawner] gm4_spawner_fuel 2

#destroy the flower
setblock ~ ~-1 ~ dirt replace
#play sound
playsound entity.generic.eat block @a[distance=..8] ~ ~ ~ 0.5 0.75
playsound block.gravel.break block @a[distance=..8] ~ ~ ~ 0.5 0.7
