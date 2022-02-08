# @s = armor_stand
# at @s
# run from gm4_better_armour_stands:default/check

execute if score @s gm4_particle matches 100.. run kill @e[type=area_effect_cloud,tag=gm4_particles_pack_cloud,distance=..1,limit=1,sort=nearest]
scoreboard players reset @s gm4_particle
