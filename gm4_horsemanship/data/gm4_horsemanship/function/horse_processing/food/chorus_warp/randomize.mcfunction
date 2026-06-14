# code taken from Orb of Ankou - expeditious
# @s = warp marker
# at @s (original spawn location!)
# run from horse_processing/food/chorus_warp/spawn_marker
# run from horse_processing/food/chorus_warp/tp_marker

tp @s ~-8 ~ ~-8
execute store result score $randomX gm4_horse_data run random value 0..16
execute store result score $randomZ gm4_horse_data run random value 0..16

function gm4_horsemanship:horse_processing/food/chorus_warp/tp_marker
