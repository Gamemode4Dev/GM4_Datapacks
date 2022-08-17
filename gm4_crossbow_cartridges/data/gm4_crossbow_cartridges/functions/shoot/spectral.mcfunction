# @s = player using the crossbow with a spectral arrow
# at @s
# run from advancement shoot/spectral

advancement revoke @s only gm4_crossbow_cartridges:shoot/spectral

# store type of glowing
execute if predicate gm4_crossbow_cartridges:items/bucket run data modify storage gm4_crossbow_cartridges:temp projectile.ActiveEffects set value [{Id:24,Amplifier:0b,Duration:200}]
execute unless predicate gm4_crossbow_cartridges:items/bucket run data modify storage gm4_crossbow_cartridges:temp projectile.Glowing set value 1

# tag arrow, 3 if multishot
execute anchored eyes positioned ^ ^ ^ run tag @e[type=minecraft:spectral_arrow,nbt={inGround:0b},distance=..0.2,sort=nearest,limit=3] add gm4_cb_arrow

# check offhand item and replace spectral_arrow by projectile
execute positioned as @e[type=spectral_arrow,tag=gm4_cb_arrow,limit=1,distance=..2,sort=nearest] run function gm4_crossbow_cartridges:check_projectile
