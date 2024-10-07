# runs main functions in the nether
# @s = none
# located at world spawn, in the nether
# run from main

# check if player is in the nether
execute store result score nether_player gm4_oa_forge if entity @a[gamemode=!spectator,x=0,limit=1]
execute unless score nether_player gm4_oa_forge matches 1.. run return 0

# mark soul altars as loaded if a player is nearby
execute store result score loaded_forge gm4_oa_forge at @e[type=armor_stand,x=0,tag=gm4_soul_forge] if entity @a[gamemode=!spectator,distance=..8,limit=1]
execute unless score loaded_forge gm4_oa_forge matches 1.. run return 0

# destroy soul forge
execute as @e[type=armor_stand,x=0,tag=gm4_soul_forge] at @s unless block ~ ~ ~ soul_fire run function gm4_orb_of_ankou:soul_forge/destroy

# soul forge visuals
execute as @e[type=armor_stand,x=0,tag=gm4_soul_forge] at @s if predicate gm4_orb_of_ankou:has_multiblock run function gm4_orb_of_ankou:soul_forge/process
