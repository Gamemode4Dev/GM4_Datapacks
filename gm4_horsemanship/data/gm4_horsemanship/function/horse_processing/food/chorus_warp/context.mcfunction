# schedule is needed to let teleport work, because minecraft, that's why
# @s = unspecified
# at unspecified
# run from horse_processing/food/type/chorus_fruit

# regain context
execute as @e[type=#gm4_horsemanship:trainable,tag=gm4_horse_warp_target] at @s run function gm4_horsemanship:horse_processing/food/chorus_warp/attempt
