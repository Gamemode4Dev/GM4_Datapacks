# run checks on campfires and apply effect to players
execute as @e[type=marker,tag=gm4_campfire] at @s run function gm4_cozy_campfires:cozy_campfire

schedule function gm4_cozy_campfires:main 80t
