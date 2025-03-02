# Gives player the vanilla flower pot item back that they tried to plant in a custom flower pot, reset signal score
# @s = player who triggered advancement
# at @s
# with {id}
# run from vanilla_pot_handling/as_player

scoreboard players set $signal_give_back gm4_blossoming_pots.misc 0
$summon minecraft:item ~ ~ ~ {Item:{id:"$(id)"}}
