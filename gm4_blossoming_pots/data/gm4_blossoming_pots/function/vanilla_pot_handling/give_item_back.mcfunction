# Gives player the vanilla flower pot item back that they tried to plant in a custom flower pot
# @s = player who triggered advancement
# at @s
# with {id}
# run from vanilla_pot_handling/as_player

$summon minecraft:item ~ ~ ~ {Item:{id:"$(id)"}}
