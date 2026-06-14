# check if the horse would fit in this location
# @s = warp marker
# at @s
# run from horse_processing/food/chorus_warp/set_ypos

scoreboard players set $ground_found gm4_horse_data 0

$execute positioned ~$(distance) ~ ~$(distance) store result score $warp_safe gm4_horse_data run function gm4_horsemanship:horse_processing/food/chorus_warp/check_block
execute if score $warp_safe gm4_horse_data matches 0 run return 0
$execute positioned ~-$(distance) ~ ~$(distance) store result score $warp_safe gm4_horse_data run function gm4_horsemanship:horse_processing/food/chorus_warp/check_block
execute if score $warp_safe gm4_horse_data matches 0 run return 0
$execute positioned ~$(distance) ~ ~-$(distance) store result score $warp_safe gm4_horse_data run function gm4_horsemanship:horse_processing/food/chorus_warp/check_block
execute if score $warp_safe gm4_horse_data matches 0 run return 0
$execute positioned ~-$(distance) ~ ~-$(distance) store result score $warp_safe gm4_horse_data run function gm4_horsemanship:horse_processing/food/chorus_warp/check_block
execute if score $warp_safe gm4_horse_data matches 0 run return 0
execute if score $ground_found gm4_horse_data matches 0 run return 0

$execute positioned ~$(distance) ~$(height) ~$(distance) store result score $warp_safe gm4_horse_data run function gm4_horsemanship:horse_processing/food/chorus_warp/check_block
execute if score $warp_safe gm4_horse_data matches 0 run return 0
$execute positioned ~-$(distance) ~$(height) ~$(distance) store result score $warp_safe gm4_horse_data run function gm4_horsemanship:horse_processing/food/chorus_warp/check_block
execute if score $warp_safe gm4_horse_data matches 0 run return 0
$execute positioned ~$(distance) ~$(height) ~-$(distance) store result score $warp_safe gm4_horse_data run function gm4_horsemanship:horse_processing/food/chorus_warp/check_block
execute if score $warp_safe gm4_horse_data matches 0 run return 0
$execute positioned ~-$(distance) ~$(height) ~-$(distance) store result score $warp_safe gm4_horse_data run function gm4_horsemanship:horse_processing/food/chorus_warp/check_block
return run scoreboard players get $warp_safe gm4_horse_data
