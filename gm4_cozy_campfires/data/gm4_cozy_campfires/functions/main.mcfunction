# upgrade area effect clouds to markers
execute as @e[type=area_effect_cloud,tag=gm4_cozy_campfire] at @s run function gm4_cozy_campfires:upgrade_marker

# run checks on campfires and apply effect to players
execute as @e[type=marker,tag=gm4_campfire] at @s run function gm4_cozy_campfires:cozy_campfire

schedule function gm4_cozy_campfires:main 80t
