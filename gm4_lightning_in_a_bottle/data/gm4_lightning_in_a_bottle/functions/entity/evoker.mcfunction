# Creates an Evoker from a Pillager
# @s = pillager
# at @s
# run from lightning/check

tag @s add gm4_liab_new_evoker

# Spawn new mob
summon evoker ~ ~ ~ {Tags:["gm4_liab_new_evoker"]}

# Copies old mob data
data modify entity @e[type=evoker,tag=gm4_liab_new_evoker,limit=1,distance=0] {} merge from entity @s {}
# But modifies the loot table, if it does not already exist, and fully heals the new mob
execute as @e[type=evoker,tag=gm4_liab_new_evoker] run execute unless data entity @s DeathLootTable run data merge entity @s {Health:24f}
tag @e[type=evoker] remove gm4_liab_new_evoker

# kill old mob
tp @s ~ -10000 ~
