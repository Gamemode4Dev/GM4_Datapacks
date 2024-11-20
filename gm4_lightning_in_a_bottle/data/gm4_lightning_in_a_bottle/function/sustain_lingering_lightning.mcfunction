# strikes lightning on lingering lightning in a bottle AECs
# @s = @e[type=area_effect_cloud,tag=gm4_liab_lingering,predicate=gm4_lightning_in_a_bottle:random_strike]
# at @s
# run from main

# summon lightning; snap to lightning rod if there is one below
execute if block ~ ~-1 ~ lightning_rod align y run summon lightning_bolt ~ ~ ~
execute unless block ~ ~-1 ~ lightning_rod run summon lightning_bolt ~ ~ ~
