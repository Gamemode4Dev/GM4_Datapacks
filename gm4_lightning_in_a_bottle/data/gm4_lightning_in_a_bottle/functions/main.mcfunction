
# find lightning aecs
execute as @e[type=area_effect_cloud,tag=gm4_liab_lingering,predicate=gm4_lightning_in_a_bottle:random_strike] at @s if block ~ ~-1 ~ lightning_rod align y run summon lightning_bolt ~ ~ ~
execute as @e[type=area_effect_cloud,tag=gm4_liab_lingering,predicate=gm4_lightning_in_a_bottle:random_strike] at @s unless block ~ ~-1 ~ lightning_rod run summon lightning_bolt ~ ~ ~

schedule function gm4_lightning_in_a_bottle:main 4s
