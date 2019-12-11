#module code goes here
#kill shroomites that are no longer inside a red mushroom
execute as @e[tag=gm4_shroomite_shroom,type=area_effect_cloud] at @s unless block ~ ~ ~ red_mushroom run kill @s
#kill spores that are inside non-porous blocks or caught by a spore catcher block
execute as @e[tag=gm4_shroomite_spore,type=area_effect_cloud] at @s if block ~ ~ ~ #shroomites:spore_catcher run kill @s
execute as @e[tag=gm4_shroomite_spore,type=area_effect_cloud] at @s unless block ~ ~ ~ #shroomites:spore_porous run kill @s

#spore spawn timer. Spawns a spore with a lifetime of 8 steps (8x16 seconds + 1 tick (1361 ticks) ) every 58.4 seconds (shroom_time=73..)
scoreboard players add @e[tag=gm4_shroomite,type=area_effect_cloud] gm4_shroom_time 1
execute as @e[tag=gm4_shroomite_shroom,type=area_effect_cloud,scores={gm4_shroom_time=73..}] at @s run function shroomites:spore_spawn

#spore spreader. Moves spores one block every 16 seconds (shroom_time=20..)
execute as @e[tag=gm4_shroomite_spore,type=area_effect_cloud,scores={gm4_shroom_time=20..}] at @s run function shroomites:spore_spread

#play particles cause teleporting aecs doesn't update their pos on the client
execute at @e[tag=gm4_shroomite_spore,type=area_effect_cloud] run particle mycelium ~ ~ ~ .15 0 .15 1 4 normal @a[distance=..8]

#mooshroom shedding shrooms
#time should be 4500 after testing
scoreboard players add gm4_shroom_countdown gm4_shroom_time 1
execute if score gm4_shroom_countdown gm4_shroom_time matches 4500.. run function shroomites:slow_shroom_timer

#advancement needs condition
#execute as @e[tag=gm4_minecart,tag=gm4_linked] at @s run advancement grant @p[distance=..1] only gm4:shroomites

schedule function shroomites:main 16t
