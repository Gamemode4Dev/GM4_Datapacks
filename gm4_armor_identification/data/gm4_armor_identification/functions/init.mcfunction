execute unless score gm4_armor_identification gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Armor identification"}
scoreboard players set gm4_armor_identification gm4_modules 1

# id
scoreboard objectives add gm4_ai_id dummy

# mobs
scoreboard objectives add gm4_ai_difficult dummy
scoreboard objectives add gm4_ai_playtime minecraft.custom:minecraft.play_time
scoreboard objectives add gm4_ai_alivetime minecraft.custom:minecraft.time_since_death

scoreboard players set #1 gm4_ai_difficult 1
scoreboard players set #10 gm4_ai_difficult 10
scoreboard players set #24000 gm4_ai_difficult 24000
scoreboard players set #168000 gm4_ai_difficult 168000

# armor modifiers
scoreboard objectives add gm4_ai_data dummy
scoreboard objectives add gm4_ai_health dummy
scoreboard objectives add gm4_ai_hurt minecraft.custom:minecraft.damage_taken
scoreboard objectives add gm4_ai_t_hurt dummy
scoreboard objectives add gm4_ai_kill minecraft.custom:minecraft.mob_kills
scoreboard objectives add gm4_ai_t_shield dummy
scoreboard objectives add gm4_ai_t_guard dummy
scoreboard objectives add gm4_ai_t_kill dummy
scoreboard objectives add gm4_ai_t_soothe dummy
scoreboard objectives add gm4_ai_t_witch dummy
scoreboard objectives add gm4_ai_guarded minecraft.custom:minecraft.damage_resisted
scoreboard objectives add gm4_ai_guard dummy
scoreboard objectives add gm4_ai_t_wolf dummy
scoreboard objectives add gm4_ai_absorp dummy
scoreboard objectives add gm4_ai_healstore dummy
scoreboard objectives add gm4_ai_damaged minecraft.custom:minecraft.damage_taken
scoreboard objectives add gm4_ai_absorped minecraft.custom:minecraft.damage_absorbed

scoreboard players set #0 gm4_ai_data 0
scoreboard players set #1 gm4_ai_data 1
scoreboard players set #2 gm4_ai_data 2
scoreboard players set #4 gm4_ai_data 4
scoreboard players set #5 gm4_ai_data 5
scoreboard players set #8 gm4_ai_data 8
scoreboard players set #10 gm4_ai_data 10
scoreboard players set #17 gm4_ai_data 17
scoreboard players set #21 gm4_ai_data 21
scoreboard players set #35 gm4_ai_data 35
scoreboard players set #64 gm4_ai_data 64

schedule function gm4_armor_identification:tick 1t
schedule function gm4_armor_identification:main 1t
schedule function gm4_armor_identification:slow_clock 1t

#$moduleUpdateList
