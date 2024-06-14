# @s = player using the crossbow with a normal arrow
# at @s
# run from advancement shoot_crossbow

advancement revoke @s only gm4_crossbow_cartridges:shoot_crossbow

execute anchored eyes positioned ^ ^ ^ if entity @e[type=minecraft:spectral_arrow,distance=..0.2,nbt={inGround:0b}] run function gm4_crossbow_cartridges:shoot/spectral

# tag arrow, 3 if multishot
execute anchored eyes positioned ^ ^ ^ run tag @e[type=minecraft:arrow,nbt={inGround:0b},distance=..0.2,sort=nearest,limit=3] add gm4_cb_arrow

# check offhand item and replace arrow by projectile
execute positioned as @e[type=arrow,tag=gm4_cb_arrow,limit=1,distance=..2,sort=nearest] run function gm4_crossbow_cartridges:check_projectile

tag @s remove gm4_cb_shot_spectral
tag @s remove gm4_cb_shot_tipped
