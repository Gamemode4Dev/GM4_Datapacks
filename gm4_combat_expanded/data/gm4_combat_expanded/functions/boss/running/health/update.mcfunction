
scoreboard players set $health_change gm4_ce_boss 960
scoreboard players operation $health_change gm4_ce_boss -= $health gm4_ce_boss

execute if entity @s[tag=gm4_ce_boss.shielded] run scoreboard players set $health_change gm4_ce_boss 0
execute if entity @s[tag=gm4_ce_boss.shielded] run playsound minecraft:item.shield.block hostile @a[distance=..64] ~ ~ ~ 1 0.8 1

scoreboard players operation @s gm4_ce_boss.health -= $health_change gm4_ce_boss
data modify entity @s Health set value 960f

execute if score $health_change gm4_ce_boss matches 1.. run playsound minecraft:entity.allay.hurt hostile @a ~ ~ ~ 0.5 0
execute if score $health_change gm4_ce_boss matches 1.. run summon item_display ~ ~0.5 ~ {Silent:1b,Tags:["gm4_ce_boss","gm4_ce_boss.hurtbox","gm4_ce_boss.temp_display"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1.04f,1.04f,1.04f]},item:{id:"minecraft:red_stained_glass",Count:1b}}

execute if score @s gm4_ce_boss.health matches ..0 run function gm4_combat_expanded:boss/defeated/kill
