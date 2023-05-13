execute unless score combat_expanded gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Combat Expanded"}
scoreboard players set combat_expanded gm4_modules 1

# scoreboards
scoreboard objectives add gm4_ce_id dummy
scoreboard objectives add gm4_ce_difficult dummy {"text":"GM4 Combat Expanded: Difficulty"}
scoreboard objectives add gm4_ce_playtime minecraft.custom:minecraft.play_time
scoreboard objectives add gm4_ce_alivetime minecraft.custom:minecraft.time_since_death
scoreboard objectives add gm4_ce_data dummy
scoreboard objectives add gm4_ce_health dummy
scoreboard objectives add gm4_ce_hurt minecraft.custom:minecraft.damage_taken
scoreboard objectives add gm4_ce_hurt2 minecraft.custom:minecraft.damage_absorbed
scoreboard objectives add gm4_ce_t_hurt dummy
scoreboard objectives add gm4_ce_kill minecraft.custom:minecraft.mob_kills
scoreboard objectives add gm4_ce_t_shield dummy
scoreboard objectives add gm4_ce_t_delay dummy
scoreboard objectives add gm4_ce_t_guard dummy
scoreboard objectives add gm4_ce_t_kill dummy
scoreboard objectives add gm4_ce_t_soothe dummy
scoreboard objectives add gm4_ce_t_witch dummy
scoreboard objectives add gm4_ce_t_wolf dummy
scoreboard objectives add gm4_ce_t_sprinting dummy
scoreboard objectives add gm4_ce_t_reactive dummy
scoreboard objectives add gm4_ce_guarded minecraft.custom:minecraft.damage_resisted
scoreboard objectives add gm4_ce_guard dummy
scoreboard objectives add gm4_ce_absorp dummy
scoreboard objectives add gm4_ce_healstore dummy
scoreboard objectives add gm4_ce_damaged minecraft.custom:minecraft.damage_taken
scoreboard objectives add gm4_ce_absorped minecraft.custom:minecraft.damage_absorbed
scoreboard objectives add gm4_ce_hunger food
scoreboard objectives add gm4_ce_shielded_hit minecraft.used:minecraft.shield
scoreboard objectives add gm4_ce_sprinting minecraft.custom:minecraft.sprint_one_cm
scoreboard objectives add gm4_ce_generation dummy
scoreboard objectives add gm4_ce_atkd dummy

# constants
scoreboard players set #0 gm4_ce_data 0
scoreboard players set #1 gm4_ce_data 1
scoreboard players set #2 gm4_ce_data 2
scoreboard players set #3 gm4_ce_data 3
scoreboard players set #4 gm4_ce_data 4
scoreboard players set #5 gm4_ce_data 5
scoreboard players set #7 gm4_ce_data 7
scoreboard players set #8 gm4_ce_data 8
scoreboard players set #10 gm4_ce_data 10
scoreboard players set #13 gm4_ce_data 13
scoreboard players set #14 gm4_ce_data 14
scoreboard players set #17 gm4_ce_data 17
scoreboard players set #21 gm4_ce_data 21
scoreboard players set #25 gm4_ce_data 25
scoreboard players set #35 gm4_ce_data 35
scoreboard players set #40 gm4_ce_data 40
scoreboard players set #64 gm4_ce_data 64
scoreboard players set #24000 gm4_ce_data 24000

# start clocks
schedule function gm4_combat_expanded:tick 1t
schedule function gm4_combat_expanded:main 2t
schedule function gm4_combat_expanded:slow_clock 3t

#$moduleUpdateList
