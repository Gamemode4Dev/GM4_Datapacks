
data merge entity @s {teleport_duration:3,Tags:["gm4_ce_boss.watcher","gm4_ce_boss.watcher.slam_block","gm4_ce_boss.watcher.head"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,1f],scale:[0.1875f,0.1875f,0.1875f]},item:{id:"minecraft:amethyst_block",count:1}}
scoreboard players operation @s gm4_ce_boss.id = $running_id gm4_ce_boss.id
playsound minecraft:block.large_amethyst_bud.place hostile @a[distance=..32] ~ ~ ~ 2 1 1
particle dragon_breath ^ ^ ^1 0.02 0.02 0.02 0.03 8
