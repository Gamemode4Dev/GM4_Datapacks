# @s = player using the crossbow with a normal arrow
# at @s
# run from advancement shoot/arrow

advancement revoke @s only gm4_crossbow_cartridges:shoot/arrow

# tag arrow, 3 if multishot
execute anchored eyes positioned ^ ^ ^ run tag @e[type=minecraft:arrow,nbt={inGround:0b},distance=..0.2,sort=nearest,limit=3] add gm4_cb_arrow

# check offhand item and replace arrow by projectile
execute positioned as @e[type=arrow,tag=gm4_cb_arrow,limit=1,distance=..2,sort=nearest] run function gm4_crossbow_cartridges:check_projectile
