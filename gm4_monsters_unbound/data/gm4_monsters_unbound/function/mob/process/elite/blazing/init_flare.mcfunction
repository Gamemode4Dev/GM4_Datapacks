# init flare block_display
# @s = flare block_display
# at @s
# run from mob/process/elite/blazing/process

data merge entity @s {Tags:["gm4_mu_elite_flare"],teleport_duration:1,brightness:{sky:15,block:15},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-0.125f,-0.125f,-0.125f],scale:[0.25f,0.25f,0.25f]},block_state:{Name:"minecraft:magma_block"}}

playsound minecraft:entity.blaze.shoot hostile @a ~ ~ ~ 1 1.2

tp @s ~ ~ ~ ~ ~
scoreboard players set @s gm4_mu_data 0

execute unless score $keep_tick.elite_process_flare gm4_mu_keep_tick matches 1 run schedule function gm4_monsters_unbound:clocks/elite/blazing_flare 1t
