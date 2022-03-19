# run from advancement hit_growing_cube
# @s = player that hit a growing slime/magma cube
# at @s

advancement revoke @s only gm4_combat_evolved:hit_growing_cube

scoreboard players set @e[type=#gm4_combat_evolved:cubes,tag=gm4_ce_growing_slime,nbt={HurtTime:10s},limit=1,sort=nearest] gm4_ce_t_hurt 15
