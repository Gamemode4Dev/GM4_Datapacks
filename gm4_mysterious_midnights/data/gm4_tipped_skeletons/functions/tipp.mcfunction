#@s = not tipped skeletons with nbt={HandItems:[{id:"minecraft:bow",Count:1b},{}],PersistenceRequired:0b}
#at @s
#called by event

tag @s add gm4_tipped_skeleton
data modify entity @s HandDropChances[1] set value 0.75f
loot replace entity @s weapon.offhand loot gm4_tipped_skeletons:tipped_type
