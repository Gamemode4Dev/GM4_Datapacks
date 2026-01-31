# spawn fear cloud skull
# @s = block_display
# at @s
# run from mob/process/elite/on_death/run

data merge entity @s {Tags:["gm4_mu_elite.fear_cloud"],teleport_duration:1,brightness:{sky:15,block:15},transformation:{left_rotation:[0f,1f,0f,0f],right_rotation:[0f,0f,0f,1f],translation:[0f,0.25f,0f],scale:[1f,1f,1f]},item:{id:"minecraft:wither_skeleton_skull",count:1}}

playsound minecraft:entity.blaze.shoot hostile @a ~ ~ ~ 1 1.2

tp @s ~ ~ ~ facing entity @p[gamemode=!spectator]

execute unless score $keep_tick.elite_death_vorpal gm4_mu_keep_tick matches 1 run schedule function gm4_monsters_unbound:clocks/elite/vorpal_death 1t
