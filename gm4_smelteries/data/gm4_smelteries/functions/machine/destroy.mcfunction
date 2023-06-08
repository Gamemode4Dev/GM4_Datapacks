# destroys the smeltery
# @s = smeltery marker
# located at @s
# run from gm4_smelteries:machine/verify_destroy

# kill entities related to machine block
execute positioned ~ ~-0.3 ~ run kill @e[type=armor_stand,tag=gm4_smeltery_stand,limit=1,distance=..0.01]
scoreboard players operation $current gm4_smelt_id = @s gm4_smelt_id
execute positioned ^ ^-1.5 ^-1 as @e[type=armor_stand,tag=gm4_smeltery_cauldron,distance=..0.01] if score @s gm4_smelt_id = $current gm4_smelt_id run kill @s
execute store result score $dropped_item gm4_machine_data run kill @e[type=item,distance=..1,nbt={Age:0s,Item:{id:"minecraft:furnace",Count:1b,tag:{display:{}}}},limit=1,sort=nearest]
kill @s

# drop item (unless broken in creative mode)
execute if score $dropped_item gm4_machine_data matches 1 run loot spawn ~ ~ ~ loot gm4_smelteries:items/smeltery
