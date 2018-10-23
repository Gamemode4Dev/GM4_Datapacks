#run from seasons:winter/skeleton_check
#@s = skeleton y_rotation=0..180 tag=!gm4_szn_checked


summon stray ~ ~ ~ {Tags:[gm4_szn_checked,gm4_szn_stray],HandItems:[{id:"minecraft:bow",Count:1b},{}]}
data merge entity @s {DeathLootTable:"empty",DeathTime:19,Health:0.0f}