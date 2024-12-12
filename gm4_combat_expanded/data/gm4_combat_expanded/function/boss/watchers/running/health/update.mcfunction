# update health value of boss if it has been hit
# @s = boss shulker (main)
# at @s
# run from boss/watchers/tick

# get damage taken
scoreboard players set $health_change gm4_ce_boss 960
scoreboard players operation $health_change gm4_ce_boss -= $health gm4_ce_boss
data modify entity @s Health set value 960f

# if immune do not apply damage and play shield sound
execute if entity @s[tag=gm4_ce_boss.watcher.immune] if score $health_change gm4_ce_boss matches 1.. run playsound minecraft:item.shield.block hostile @a[distance=..64] ~ ~ ~ 0.75 0.8 1
execute if entity @s[tag=gm4_ce_boss.watcher.immune] if score $health_change gm4_ce_boss matches 1.. run scoreboard players set $health_change gm4_ce_boss 0

# if damaged play sound and spawn hurtbox
execute if score $health_change gm4_ce_boss matches 1.. run playsound minecraft:entity.allay.hurt hostile @a ~ ~ ~ 0.5 0
execute if score $health_change gm4_ce_boss matches 1.. if score @s gm4_ce_boss.health matches 1.. summon item_display run function gm4_combat_expanded:boss/watchers/running/health/init_display

# update health value of boss with own and secondary health loss
scoreboard players operation @s gm4_ce_boss.health -= $health_change gm4_ce_boss
scoreboard players operation @s gm4_ce_boss.health -= $twin_health_change gm4_ce_boss

# trigger next phases if health drops below threshold
execute if score @s[tag=!gm4_ce_boss.watcher.has_twin,scores={gm4_ce_boss.phase=1}] gm4_ce_boss.health matches ..225 run scoreboard players set @s gm4_ce_boss.phase 2
execute if score @s[tag=!gm4_ce_boss.watcher.has_twin,scores={gm4_ce_boss.phase=2}] gm4_ce_boss.health matches ..150 run scoreboard players set @s gm4_ce_boss.phase 3
execute if score @s[tag=!gm4_ce_boss.watcher.has_twin,scores={gm4_ce_boss.phase=3}] gm4_ce_boss.health matches ..75 run scoreboard players set @s gm4_ce_boss.phase 4
execute if score @s[tag=gm4_ce_boss.watcher.has_twin,scores={gm4_ce_boss.phase=1}] gm4_ce_boss.health matches ..450 run scoreboard players set @s gm4_ce_boss.phase 2
execute if score @s[tag=gm4_ce_boss.watcher.has_twin,scores={gm4_ce_boss.phase=2}] gm4_ce_boss.health matches ..300 run scoreboard players set @s gm4_ce_boss.phase 3
execute if score @s[tag=gm4_ce_boss.watcher.has_twin,scores={gm4_ce_boss.phase=3}] gm4_ce_boss.health matches ..150 run scoreboard players set @s gm4_ce_boss.phase 4

# kill boss if health drops below 0
execute if score @s gm4_ce_boss.health matches ..0 run function gm4_combat_expanded:boss/watchers/defeated/kill
