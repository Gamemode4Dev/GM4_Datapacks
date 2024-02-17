
scoreboard players set $health_change gm4_ce_boss 960
scoreboard players operation $health_change gm4_ce_boss -= $health gm4_ce_boss

execute if entity @s[tag=gm4_ce_boss.immune] if score $health_change gm4_ce_boss matches 1.. run playsound minecraft:item.shield.block hostile @a[distance=..64] ~ ~ ~ 0.75 0.8 1
execute if entity @s[tag=gm4_ce_boss.immune] if score $health_change gm4_ce_boss matches 1.. run scoreboard players set $health_change gm4_ce_boss 0

scoreboard players operation @s gm4_ce_boss.health -= $health_change gm4_ce_boss
data modify entity @s Health set value 960f

execute if score $health_change gm4_ce_boss matches 1.. run playsound minecraft:entity.allay.hurt hostile @a ~ ~ ~ 0.5 0
execute if score $health_change gm4_ce_boss matches 1.. if score @s gm4_ce_boss.health matches 1.. summon item_display run function gm4_combat_expanded:boss/running/health/init_display

execute if score @s gm4_ce_boss.health matches ..0 run function gm4_combat_expanded:boss/defeated/kill
