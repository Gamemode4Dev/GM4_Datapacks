# add age to this foal
# @s = gm4_horse foal
# at @s
# run from horse_processing/food/type/baked_potato
# run from horse_processing/food/type/beetroot
# run from horse_processing/food/type/bread
# run from horse_processing/food/type/chorus_fruit
# run from horse_processing/food/type/dried_kelp
# run from horse_processing/food/type/glow_berries
# run from horse_processing/food/type/melon_slice
# run from horse_processing/food/type/short_grass
# run from horse_processing/food/type/sweet_berries

scoreboard players operation $age gm4_horse_data += $add_age gm4_horse_data
scoreboard players operation $age gm4_horse_data < #0 gm4_horse_data
execute store result entity @s Age int 1 run scoreboard players get $age gm4_horse_data
