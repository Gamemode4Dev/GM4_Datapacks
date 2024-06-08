# init shield display
# @s = item display
# at @s
# run from boss/watchers/health/immune_add

data merge entity @s {Tags:["gm4_ce_boss.watcher","gm4_ce_boss.watcher.shield"],brightness:{sky:2,block:2},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1.04f,1.04f,1.04f]},item:{id:"minecraft:black_stained_glass",count:1}}
scoreboard players operation @s gm4_ce_boss.id = $running_id gm4_ce_boss.id
