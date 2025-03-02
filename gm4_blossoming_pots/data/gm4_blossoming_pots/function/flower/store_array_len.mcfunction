# Sets array length because we need to macro the count
# @s = temp entity inside flower pot
# at @s align xyz positioned ~.5 ~.5 ~.5
# with {id, count}
# run from flower/prepare_data

$execute store result score $array_len gm4_blossoming_pots.misc run data get storage gm4_blossoming_pots:flower_pots $(id).$(count)
