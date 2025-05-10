# @s = fishing bobber in the end
# run from tick

# tag player that just cast the rod
tag @p[scores={gm4_cast_rod=1..},distance=..2] add gm4_ef_cast_rod

# store lure value
execute unless entity @a[tag=gm4_ef_cast_rod,predicate=gm4_end_fishing:holding_fishing_rod,limit=1] store result score @s gm4_ef_lure run data get entity @a[tag=gm4_ef_cast_rod,limit=1] equipment.offhand.components."minecraft:enchantments"."minecraft:lure"
execute if entity @a[tag=gm4_ef_cast_rod,predicate=gm4_end_fishing:holding_fishing_rod,limit=1] store result score @s gm4_ef_lure run data get entity @a[tag=gm4_ef_cast_rod,limit=1] SelectedItem.components."minecraft:enchantments"."minecraft:lure"

# bobber id
scoreboard players operation @s gm4_ef_id = @a[tag=gm4_ef_cast_rod,limit=1] gm4_ef_id

# clean up
tag @s add gm4_ef_set
tag @a remove gm4_ef_cast_rod
