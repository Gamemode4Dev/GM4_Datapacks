# run from advancement hit_growing_cube
# @s = player that hit a growing slime/magma cube
# at @s

advancement revoke @s only gm4_armor_identification:hit_growing_cube

scoreboard players set @e[type=#gm4_armor_identification:cubes,tag=gm4_ai_growing_slime,nbt={HurtTime:10s},limit=1,sort=nearest] gm4_ai_t_hurt 15
