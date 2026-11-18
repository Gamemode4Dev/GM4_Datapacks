# Find a player head, used for placing a swing
# @s = Player, placing a swing
# at @s
# run from gm4_swings:place advancement

advancement revoke @s only gm4_swings:place

execute store result score $reach gm4_swings.dummy run attribute @s minecraft:block_interaction_range get 2
scoreboard players set $raycast_distance gm4_swings.dummy 0

tag @s add gm4_swings.placer
execute anchored eyes positioned ^ ^ ^ anchored feet run function gm4_swings:place/ray
tag @s remove gm4_swings.placer
