# main loop for catching block display data up to current pot item count
# @s = temp marker inside decorated pot
# at @s align xyz positioned ~.5 ~.5 ~.5
# with block ~ ~ ~ item
# run from decorated/catch_up/initialize

scoreboard players add @s gm4_blossoming_pots.catch_up_loop 1

data modify storage gm4_blossoming_pots:decorated_pots temp.id set from block ~ ~ ~ item.id
execute store result storage gm4_blossoming_pots:decorated_pots temp.count int 1 run scoreboard players get @s gm4_blossoming_pots.catch_up_loop
$execute store result score @s gm4_blossoming_pots.merge_loop run data get storage gm4_blossoming_pots:decorated_pots $(id).display_count
function gm4_blossoming_pots:decorated/merge/loop

$execute unless score @s gm4_blossoming_pots.catch_up_loop matches $(count).. run function gm4_blossoming_pots:decorated/catch_up/loop with block ~ ~ ~ item
data remove storage gm4_blossoming_pots:decorated_pots temp