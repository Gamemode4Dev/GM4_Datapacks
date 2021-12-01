# run by a player

execute unless score #pregen_direction gm4_orbis_config matches 1.. run scoreboard players set #pregen_x gm4_orbis_config 0
execute unless score #pregen_direction gm4_orbis_config matches 1.. run scoreboard players set #pregen_z gm4_orbis_config 0
execute unless score #pregen_direction gm4_orbis_config matches 1.. run scoreboard players set #pregen_direction gm4_orbis_config 1

scoreboard players set pregen_enabled gm4_orbis_config 1

tag @s[type=player] add gm4_orbis_pregen_active
gamemode spectator @s[type=player]

summon marker ~ ~ ~ {CustomName:'"gm4_orbis_pregen_position"',Tags:["gm4_orbis_pregen_position"]}
execute as @e[type=marker,tag=gm4_orbis_pregen_position,distance=..1,limit=1] run function gm4_orbis:pregen/teleport
