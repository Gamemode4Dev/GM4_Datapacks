# Creates an Elder Guardian from a Guardian
# @s = guardian
# at @s
# run from lightning/check

tag @s add gm4_liab_new_elder_guardian

# Spawn new mob
summon elder_guardian ~ ~ ~ {Tags:["gm4_liab_new_elder_guardian"]}

# Copies old mob data
data modify entity @e[type=elder_guardian,tag=gm4_liab_new_elder_guardian,limit=1,distance=0] {} merge from entity @s {}
# But modifies the loot table, if it does not already exist, and fully heals the new mob
execute as @e[type=elder_guardian,tag=gm4_liab_new_elder_guardian] run execute unless data entity @s DeathLootTable run data merge entity @s {DeathLootTable:"gm4_lightning_in_a_bottle:entities/elder_guardian",Health:80f}

tag @e[type=elder_guardian] remove gm4_liab_new_elder_guardian
tp @s ~ -10000 ~
