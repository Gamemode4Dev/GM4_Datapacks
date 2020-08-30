# run checks on campfires and apply effect to players
execute as @e[type=area_effect_cloud,tag=gm4_cozy_campfire] at @s run function gm4_cozy_campfires:campfire/structure/validate

schedule function gm4_cozy_campfires:main 80t
