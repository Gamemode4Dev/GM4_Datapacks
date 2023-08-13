# destroys the auto_crafter
# @s = auto_crafter marker
# located at @s
# run from gm4_auto_crafting:machine/verify_destroy

# clear buffer
data modify storage gm4_auto_crafting:temp buffer set from entity @s data.gm4_auto_crafting.buffer
execute if data storage gm4_auto_crafting:temp buffer[-1] run function gm4_auto_crafting:machine/drop_items
data remove storage gm4_auto_crafting:temp buffer

# kill entities related to machine block
execute positioned ~ ~-1.44 ~ run kill @e[type=armor_stand,tag=gm4_auto_crafter_stand,limit=1,distance=..0.1]
execute store result score $dropped_item gm4_machine_data run kill @e[type=item,distance=..1,nbt={Age:0s,Item:{id:"minecraft:dropper",Count:1b,tag:{display:{}}}},limit=1,sort=nearest]
kill @s

# drop item (unless broken in creative mode)
particle block crafting_table ~ ~ ~ .1 .25 .1 .05 30 normal @a
execute if score $dropped_item gm4_machine_data matches 1 run loot spawn ~ ~ ~ loot gm4_auto_crafting:items/auto_crafter
