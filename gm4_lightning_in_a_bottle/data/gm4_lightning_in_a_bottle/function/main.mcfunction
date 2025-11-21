
# find lightning aecs
execute as @e[type=area_effect_cloud,tag=gm4_liab_lingering,predicate=gm4_lightning_in_a_bottle:random_strike] at @s run function gm4_lightning_in_a_bottle:sustain_lingering_lightning

# summon lightning rod - brewing stand connectors if needed
execute as @e[type=marker,tag=gm4_brewing_stand] at @s if block ~ ~1 ~ #gm4_lightning_in_a_bottle:lightning_rod[facing=up] \
  align xyz unless entity @e[tag=gm4_lightning_rod_texture_connector,dy=0.01,limit=1] run function gm4_lightning_in_a_bottle:brewing_stand/texture_connector/summon

schedule function gm4_lightning_in_a_bottle:main 4s
