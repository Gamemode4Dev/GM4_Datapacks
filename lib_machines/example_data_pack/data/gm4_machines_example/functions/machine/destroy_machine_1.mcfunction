# kill entities related to machine block
#  this example shows how to kill the correct item when the custom block is just a normal block
execute store result score $dropped_item gm4_machine_data run kill @e[type=item,distance=..1,nbt={Age:0s,Item:{id:"minecraft:piston",Count:1b}},nbt=!{Item:{tag:{}}},limit=1,sort=nearest]
kill @s

# drop item (unless broken in creative mode)
execute if score $dropped_item gm4_machine_data matches 1 run loot spawn ~ ~ ~ loot gm4_machines_example:items/custom_machine_1
