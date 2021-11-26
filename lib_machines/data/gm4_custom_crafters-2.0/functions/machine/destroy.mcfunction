# destroys the custom crafter
# @s = custom crafter marker
# located at @s
# run from gm4_custom_crafters-2.0:machine/verify_destroy

# kill entities related to machine block
execute positioned ~ ~-0.4 ~ run kill @e[type=armor_stand,tag=gm4_custom_crafter_stand,limit=1,distance=..0.01]
execute store result score $dropped_item gm4_machine_data run kill @e[type=item,nbt={Age:0s,Item:{id:"minecraft:dropper",Count:1b,tag:{display:{Name:'{"translate":"%1$s%3427655$s","with":["Custom Crafter",{"translate":"block.gm4.custom_crafter"}]}'}}}},limit=1,sort=nearest]
kill @s

# drop item (unless broken in creative mode)
particle block crafting_table ~ ~ ~ .1 .25 .1 .05 30 normal @a
execute if score $dropped_item gm4_machine_data matches 1 run loot spawn ~ ~ ~ loot gm4_custom_crafters-2.0:items/custom_crafter
