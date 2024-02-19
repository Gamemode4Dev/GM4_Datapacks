
scoreboard players set $twin_health_change gm4_ce_boss 960
scoreboard players operation $twin_health_change gm4_ce_boss -= $health gm4_ce_boss

# cap damage at one time to 35
execute if score $twin_health_change gm4_ce_boss matches 36.. run scoreboard players set $twin_health_change gm4_ce_boss 35

execute if entity @s[tag=gm4_ce_boss.immune] if score $twin_health_change gm4_ce_boss matches 1.. run playsound minecraft:item.shield.block hostile @a[distance=..64] ~ ~ ~ 0.75 0.8 1
execute if entity @s[tag=gm4_ce_boss.immune] if score $twin_health_change gm4_ce_boss matches 1.. run scoreboard players set $twin_health_change gm4_ce_boss 0

data modify entity @s Health set value 960f

execute if score $twin_health_change gm4_ce_boss matches 1.. run playsound minecraft:entity.allay.hurt hostile @a ~ ~ ~ 0.5 0
execute if score $twin_health_change gm4_ce_boss matches 1.. summon item_display run function gm4_combat_expanded:boss/watchers/running/health/init_display
