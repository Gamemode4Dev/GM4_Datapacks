# sets array length because we need to macro the count
# @s = temp marker inside flower pot
# at @s align xyz positioned ~.5 ~.5 ~.5
# with {id, count}
# run from flower/as_marker


$execute store result score $array_len gm4_blossoming_pots.loop run data get storage gm4_blossoming_pots:flower_pots $(id).$(count)
