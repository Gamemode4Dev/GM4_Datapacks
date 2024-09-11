# init hurtbox display
# @s = item display
# at @s
# run from boss/watchers/health/update

data merge entity @s {Tags:["gm4_ce_boss.watcher","gm4_ce_boss.watcher.hurtbox","gm4_ce_boss.watcher.temp_display","gm4_ce_boss.watcher.head"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0.5f,0f],scale:[1.04f,1.04f,1.04f]},item:{id:"minecraft:red_stained_glass",count:1}}
scoreboard players operation @s gm4_ce_boss.id = $running_id gm4_ce_boss.id
