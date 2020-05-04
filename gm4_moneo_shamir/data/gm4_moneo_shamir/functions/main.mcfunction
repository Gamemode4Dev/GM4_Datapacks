# moneo main
# run from expansion/pulse_check

scoreboard players reset tool_max_damage gm4_ml_data
scoreboard players reset tool_current_damage gm4_ml_data

execute as @a[gamemode=!spectator,predicate=gm4_moneo_shamir:holding_moneo] at @s run function gm4_moneo_shamir:active

schedule function gm4_moneo_shamir:main 16t
