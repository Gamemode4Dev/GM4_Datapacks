# destroys the teleportation_anchor
# @s = teleportation_anchor marker
# located at @s
# run from gm4_teleportation_anchors:machine/verify_destroy

# kill entities related to machine block
execute positioned ~ ~-0.4 ~ run kill @e[type=armor_stand,tag=gm4_teleportation_anchor_stand,limit=1,distance=..0.01]
execute store result score $dropped_item gm4_machine_data run kill @e[type=item,distance=..1,nbt={Age:0s,Item:{id:"minecraft:lodestone",Count:1b}},nbt=!{Item:{tag:{}}},limit=1,sort=nearest]
kill @s

# drop item (unless broken in creative mode)
particle block end_portal_frame ~ ~0.6 ~ .1 .25 .1 .05 30 normal @a
execute if score $dropped_item gm4_machine_data matches 1 run loot spawn ~ ~ ~ loot gm4_teleportation_anchors:items/teleportation_anchor
