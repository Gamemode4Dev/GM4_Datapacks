#@s = fishing bobber in the end
#run from tick

tag @s add gm4_ef_set

#store lure value
execute at @p[scores={gm4_cast_rod=1..},distance=..2] unless entity @p[distance=..0.01,nbt={SelectedItem:{id:"minecraft:fishing_rod"}}] store result score @s gm4_ef_lure run data get entity @p[scores={gm4_cast_rod=1..},distance=..2] Inventory[{Slot:-106b}].tag.Enchantments[{id:"minecraft:lure"}].lvl
execute at @p[scores={gm4_cast_rod=1..},distance=..2] if entity @p[distance=..0.01,nbt={SelectedItem:{id:"minecraft:fishing_rod"}}] store result score @s gm4_ef_lure run data get entity @p[scores={gm4_cast_rod=1..},distance=..2] SelectedItem.tag.Enchantments[{id:"minecraft:lure"}].lvl

#bobber id
scoreboard players operation @s gm4_ef_id = @p[scores={gm4_cast_rod=1..}] gm4_ef_id
