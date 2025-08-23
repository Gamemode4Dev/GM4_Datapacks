# destroys the soul glass
# @s = gm4_soul_glass marker
# located at @s
# run from gm4_soul_glass:machine/verify_destroy

# restore beacon effect
execute if score @s gm4_sg_primary matches 1 run data modify block ~ ~-1 ~ primary_effect set value "minecraft:speed"
execute if score @s gm4_sg_primary matches 3 run data modify block ~ ~-1 ~ primary_effect set value "minecraft:haste"
execute if score @s gm4_sg_primary matches 5 run data modify block ~ ~-1 ~ primary_effect set value "minecraft:strength"
execute if score @s gm4_sg_primary matches 8 run data modify block ~ ~-1 ~ primary_effect set value "minecraft:jump_boost"
execute if score @s gm4_sg_primary matches 11 run data modify block ~ ~-1 ~ primary_effect set value "minecraft:resistance"

execute if score @s gm4_sg_secondary matches 1 run data modify block ~ ~-1 ~ secondary_effect set value "minecraft:speed"
execute if score @s gm4_sg_secondary matches 3 run data modify block ~ ~-1 ~ secondary_effect set value "minecraft:haste"
execute if score @s gm4_sg_secondary matches 5 run data modify block ~ ~-1 ~ secondary_effect set value "minecraft:strength"
execute if score @s gm4_sg_secondary matches 8 run data modify block ~ ~-1 ~ secondary_effect set value "minecraft:jump_boost"
execute if score @s gm4_sg_secondary matches 10 run data modify block ~ ~-1 ~ secondary_effect set value "minecraft:regeneration"
execute if score @s gm4_sg_secondary matches 11 run data modify block ~ ~-1 ~ secondary_effect set value "minecraft:resistance"

# kill entities related to machine block
execute store result score $dropped_item gm4_machine_data run kill @e[type=item,distance=..1,nbt={Age:0s,Item:{id:"minecraft:brown_stained_glass",count:1}},nbt=!{Item:{components:{}}},limit=1,sort=nearest]
kill @s

# drop item (unless broken in creative mode)
execute if score $dropped_item gm4_machine_data matches 1 run loot spawn ~ ~ ~ loot gm4_soul_glass:items/soul_glass
