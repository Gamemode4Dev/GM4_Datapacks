# Find the interaction the player just interacted with
# @s = Player, who interacted with a swing interaction
# at @s
# run from gm4_swings:interactions/interact advancement

advancement revoke @s only gm4_swings:interactions/interact

execute store result score $is_sneaking gm4_swings.dummy if predicate gm4_swings:sneaking

tag @s add gm4_swings.interacter
execute as @n[type=minecraft:interaction,tag=gm4_swings.interaction.hit,nbt={interaction:{}},distance=..20] at @s run function gm4_swings:interactions/interact/on_interaction
tag @s remove gm4_swings.interacter
