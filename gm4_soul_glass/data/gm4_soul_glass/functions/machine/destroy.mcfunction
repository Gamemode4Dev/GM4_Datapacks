# destroys the trapped_sign
# @s = trapped_sign marker
# located at @s
# run from gm4_smelteries:machine/verify_destroy

# kill entities related to machine block
execute store result score $dropped_item gm4_machine_data run kill @e[type=item,distance=..1,nbt={Age:0s,Item:{id:"minecraft:brown_stained_glass",Count:1b}},nbt=!{Item:{tag:{}}},limit=1,sort=nearest]
kill @s

# drop item (unless broken in creative mode)
execute if score $dropped_item gm4_machine_data matches 1 run loot spawn ~ ~ ~ loot gm4_soul_glass:items/soul_glass
