# @s = player using the crossbow with a tipped arrow
# at @s
# run from advancement shoot/tipped

advancement revoke @s only gm4_crossbow_cartridges:shoot/tipped

# tag arrow, 3 if multishot
execute anchored eyes positioned ^ ^ ^ run tag @e[type=minecraft:arrow,nbt={inGround:0b},distance=..0.2,sort=nearest,limit=3] add gm4_cb_arrow

# store tipped arrow potion data
data modify storage gm4_crossbow_cartridges:temp projectile.ActiveEffects set from entity @e[type=arrow,tag=gm4_cb_arrow,limit=1,distance=..2] CustomPotionEffects
data modify storage gm4_crossbow_cartridges:temp effect set from entity @e[type=arrow,tag=gm4_cb_arrow,limit=1,distance=..2] Potion
execute if data storage gm4_crossbow_cartridges:temp effect run function gm4_crossbow_cartridges:shoot/effect

# check offhand item and replace spectral_arrow by projectile
execute positioned as @e[type=arrow,tag=gm4_cb_arrow,limit=1,distance=..2,sort=nearest] run function gm4_crossbow_cartridges:check_projectile

data remove storage gm4_crossbow_cartridges:temp effect
