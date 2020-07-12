# run checks on campfires
execute as @e[type=area_effect_cloud,tag=gm4_cozy_campfire] at @s run function gm4_cozy_campfires:campfire/structure/validate

# apply attributes to players near a campfire
execute as @a run function gm4_cozy_campfires:player/manage_attribute

schedule function gm4_cozy_campfires:main 80t
