#@s = not tipped skeletons with nbt={equipment:{mainhand:{id:"minecraft:bow",count:1}},PersistenceRequired:0b}
#at @s
#called by event

tag @s add gm4_tipped_skeleton
data modify entity @s drop_chances merge value {offhand:0.75f}
loot replace entity @s weapon.offhand loot gm4_tipped_skeletons:tipped_type
