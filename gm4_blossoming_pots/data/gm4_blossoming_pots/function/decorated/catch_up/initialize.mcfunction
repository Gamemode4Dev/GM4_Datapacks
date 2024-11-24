# Intializes the loop for catching block display data up to current pot item count
# @s = temp marker inside decorated pot
# at @s align xyz positioned ~.5 ~.5 ~.5
# run from decorated/as_marker

scoreboard players set @s gm4_blossoming_pots.catch_up_loop 0
function gm4_blossoming_pots:decorated/catch_up/loop with block ~ ~ ~ item