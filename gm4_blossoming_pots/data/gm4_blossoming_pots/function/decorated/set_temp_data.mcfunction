# sets temp.data for the loop
# @s = temp marker inside decorated pot
# at @s align xyz positioned ~.5 ~.5 ~.5
# with storage gm4_blossoming_pots:decorated_pots temp
# run from decorated/loop


$data modify storage gm4_blossoming_pots:decorated_pots temp.data set from storage gm4_blossoming_pots:decorated_pots $(id).$(count)[$(score)]
