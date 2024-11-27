# sets array length because we need to macro the count
# @s = temp marker inside decorated pot
# at @s align xyz positioned ~.5 ~.5 ~.5
# with storage gm4_blossoming_pots:flower_pots temp
# run from decorated/loop


$execute store result score $array_len gm4_blossoming_pots.loop run data get storage gm4_blossoming_pots:flower_pots $(id).$(count)
