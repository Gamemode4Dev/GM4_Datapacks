# Creates an Illusioner from a Evoker
# @s = evoker
# at @s
# run from lightning/check

tag @s add gm4_liab_new_illusioner

# Spawn new mob
summon illusioner ~ ~ ~ {Tags:["gm4_liab_new_illusioner"]}

# Copies old mob data
data modify entity @e[type=illusioner,tag=gm4_liab_new_illusioner,limit=1,distance=0] {} merge from entity @s {}
# But modifies the loot table, if it does not already exist, and fully heals the new mob
execute as @e[type=illusioner,tag=gm4_liab_new_illusioner] run execute unless data entity @s DeathLootTable run data merge entity @s {DeathLootTable:"gm4_lightning_in_a_bottle:entities/illusioner",Health:32f}
tag @e[type=illusioner] remove gm4_liab_new_illusioner

# Kill old mob
tp @s ~ -10000 ~
