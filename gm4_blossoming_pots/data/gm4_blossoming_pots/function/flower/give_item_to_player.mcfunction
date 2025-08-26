# Summons an item stack at the players feet for them to pick up & resets signal
# @s = player who right clicked on custom flower pot with an empty hand
# at temp marker align xyz positioned ~.5 ~.5 ~.5
# with {id, count}
# run from flower/as_player


scoreboard players set $signal_give_back gm4_blossoming_pots.misc 0
$execute at @s run summon minecraft:item ~ ~ ~ {Item:{id:"$(id)",count:$(count)}}
