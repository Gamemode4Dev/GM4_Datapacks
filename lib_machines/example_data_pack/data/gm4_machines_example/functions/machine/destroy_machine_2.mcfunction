# kill entities related to machine block
#  this example shows how to kill related entities and the correct item when the block has a custom name
execute positioned ~ ~-0.5 ~ run kill @e[type=armor_stand,tag=machine_display_2,limit=1,distance=..0.01]
execute store result score $dropped_item gm4_machine_data run kill @e[type=item,distance=..1,nbt={Age:0s,Item:{id:"minecraft:hopper",Count:1b,tag:{display:{Name:'{"text":"Machine 2"}'}}}},limit=1,sort=nearest]
kill @s

# drop item (unless broken in creative mode)
execute if score $dropped_item gm4_machine_data matches 1 run loot spawn ~ ~ ~ loot gm4_machines_example:items/custom_machine_2
