#run from seasons:summer/zombie_check
#@s = zombies y_rotation=0..180 tag=!gm4_szn_checked


summon husk ~ ~ ~ {Tags:[gm4_szn_checked,gm4_szn_husk]}
data merge entity @s {DeathLootTable:"empty",DeathTime:19,Health:0.0f}