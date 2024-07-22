
data merge entity @s {Tags:["gm4_ce_elite_flare"],teleport_duration:1,brightness:{sky:15,block:15},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-0.125f,-0.125f,-0.125f],scale:[0.25f,0.25f,0.25f]},block_state:{Name:"minecraft:magma_block"}}

playsound minecraft:entity.blaze.shoot hostile @a ~ ~ ~ 1 1.2

tp @s ~ ~ ~ facing entity @p[gamemode=!spectator]
execute at @s run tp @s ~ ~ ~ ~ -60
scoreboard players set @s gm4_ce_data 0

execute unless score $keep_tick.elite_process_flare gm4_ce_keep_tick matches 1 run schedule function gm4_combat_expanded:clocks/temp/elite_process_flare 1t
