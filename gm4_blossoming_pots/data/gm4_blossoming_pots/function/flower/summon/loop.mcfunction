# main loop for summoning block displays
# @s = temp marker inside flower pot
# at @s align xyz positioned ~.5 ~.5 ~.5
# run from flower/summon/initialize
# run from this function...

scoreboard players remove @s gm4_blossoming_pots.summon_loop 1

# store the current score into storage
execute store result storage gm4_blossoming_pots:flower_pots temp.number int 1 run scoreboard players get @s gm4_blossoming_pots.summon_loop

# summon block display
function gm4_blossoming_pots:flower/summon/display with storage gm4_blossoming_pots:flower_pots temp

# if there are more block displays to summon, run again
execute unless score @s gm4_blossoming_pots.summon_loop matches 0 run function gm4_blossoming_pots:flower/summon/loop