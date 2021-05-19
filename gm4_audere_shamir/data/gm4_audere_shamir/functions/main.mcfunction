scoreboard players reset tool_max_damage gm4_ml_data
scoreboard players reset tool_current_damage gm4_ml_data

execute as @a[gamemode=!spectator,predicate=gm4_audere_shamir:holding_audere] at @s run function gm4_audere_shamir:active_tool

schedule function gm4_audere_shamir:main 16t
