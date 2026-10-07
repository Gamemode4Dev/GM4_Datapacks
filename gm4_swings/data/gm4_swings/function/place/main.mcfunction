advancement revoke @s only gm4_swings:place

execute store result score $reach gm4_swings.dummy run attribute @s minecraft:block_interaction_range get 2
scoreboard players set $raycast_distance gm4_swings.dummy 0

tag @s add gm4_swings.placer
execute anchored eyes positioned ^ ^ ^ anchored feet run function gm4_swings:place/ray
tag @s remove gm4_swings.placer