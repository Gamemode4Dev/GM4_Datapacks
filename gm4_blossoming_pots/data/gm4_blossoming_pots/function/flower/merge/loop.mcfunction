# main loop for merging block display data
# @s = temp marker inside flower pot
# at @s align xyz positioned ~.5 ~.5 ~.5
# run from flower/merge/initialize
# run from this function...

scoreboard players remove @s gm4_blossoming_pots.merge_loop 1

# store the current score into storage
execute store result storage gm4_blossoming_pots:flower_pots temp.number int 1 run scoreboard players get @s gm4_blossoming_pots.merge_loop

# merge block display data
function gm4_blossoming_pots:flower/merge/transfer with storage gm4_blossoming_pots:flower_pots temp

# if there are more block displays to merge, run again
execute unless score @s gm4_blossoming_pots.merge_loop matches 0 run function gm4_blossoming_pots:flower/merge/loop