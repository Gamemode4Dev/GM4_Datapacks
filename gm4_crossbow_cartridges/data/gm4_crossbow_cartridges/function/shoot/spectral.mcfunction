# @s = player using the crossbow with a spectral arrow
# at @s
# run from function shoot/any_arrow

# store type of glowing
execute if predicate gm4_crossbow_cartridges:items/bucket run data modify storage gm4_crossbow_cartridges:temp projectile.active_effects set value [{id:'minecraft:glowing',amplifier:0b,duration:200}]
execute unless predicate gm4_crossbow_cartridges:items/bucket run data modify storage gm4_crossbow_cartridges:temp projectile.Glowing set value 1

# tag arrow, 3 if multishot
tag @e[type=minecraft:spectral_arrow,nbt={inGround:0b},distance=..0.2,sort=nearest,limit=3] add gm4_cb_arrow
