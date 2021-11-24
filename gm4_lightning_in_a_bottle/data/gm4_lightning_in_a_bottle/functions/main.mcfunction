
# find lightning aecs
execute as @e[type=area_effect_cloud,tag=gm4_liab_lingering,predicate=gm4_lightning_in_a_bottle:random_strike] at @s run function gm4_lightning_in_a_bottle:sustain_lingering_lightning

# maintain lightning rod - brewing stand connectors
execute as @e[type=marker,tag=gm4_brewing_stand] at @s run function gm4_lightning_in_a_bottle:brewing_stand/texture_connector/check_structure

schedule function gm4_lightning_in_a_bottle:main 4s
