execute unless score combat_expanded gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Combat Expanded"}
execute unless score combat_expanded gm4_earliest_version < combat_expanded gm4_modules run scoreboard players operation combat_expanded gm4_earliest_version = combat_expanded gm4_modules
scoreboard players set combat_expanded gm4_modules 1

# disable natural regeneration
execute unless score $natural_regen gm4_ce_data matches -1 store result score $natural_regen gm4_ce_data run gamerule naturalRegeneration
execute unless score $natural_regen_disabled gm4_ce_data matches 1.. run gamerule naturalRegeneration false
execute unless score $natural_regen_disabled gm4_ce_data matches 1.. if score $natural_regen gm4_ce_data matches 1 run data modify storage gm4:log queue append value {type:"text",message:'{"text":"Combat Expanded: disabled Natural Regeneration"}'}
scoreboard players set $natural_regen_disabled gm4_ce_data 1

# disable natural phantom spawning
execute unless score $phantoms gm4_ce_data matches -1 store result score $phantoms gm4_ce_data run gamerule doInsomnia
execute unless score $phantoms_disabled gm4_ce_data matches 1.. run gamerule doInsomnia false
execute unless score $phantoms_disabled gm4_ce_data matches 1.. if score $phantoms gm4_ce_data matches 1 run data modify storage gm4:log queue append value {type:"text",message:'{"text":"Combat Expanded: disabled Phantom Spawning"}'}
scoreboard players set $phantoms_disabled gm4_ce_data 1

# scoreboards
scoreboard objectives add gm4_ce_id dummy
scoreboard objectives add gm4_ce_difficult dummy {"text":"GM4 Combat Expanded: Difficulty"}
scoreboard objectives add gm4_ce_play_time dummy
scoreboard objectives add gm4_ce_death_mult dummy
scoreboard objectives add gm4_ce_since_last_death dummy
scoreboard objectives add gm4_ce_alivetime minecraft.custom:minecraft.time_since_death
scoreboard objectives add gm4_ce_deaths minecraft.custom:minecraft.deaths
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
scoreboard objectives add gm4_ce_t_wolf dummy
scoreboard objectives add gm4_ce_t_sprinting dummy
scoreboard objectives add gm4_ce_sprinting_timeout dummy
scoreboard objectives add gm4_ce_t_reactive dummy
scoreboard objectives add gm4_ce_absorp dummy
scoreboard objectives add gm4_ce_healstore dummy
scoreboard objectives add gm4_ce_damaged minecraft.custom:minecraft.damage_taken
scoreboard objectives add gm4_ce_absorped minecraft.custom:minecraft.damage_absorbed
scoreboard objectives add gm4_ce_hunger food
scoreboard objectives add gm4_ce_shielded_hit minecraft.used:minecraft.shield
scoreboard objectives add gm4_ce_sprinting minecraft.custom:minecraft.sprint_one_cm
scoreboard objectives add gm4_ce_generation dummy
scoreboard objectives add gm4_ce_swimming minecraft.custom:minecraft.swim_one_cm
scoreboard objectives add gm4_ce_used_bow minecraft.used:minecraft.bow
scoreboard objectives add gm4_ce_used_crossbow minecraft.used:minecraft.crossbow
scoreboard objectives add gm4_ce_natural_regen_damage dummy
scoreboard objectives add gm4_ce_natural_regen_delay dummy
scoreboard objectives add gm4_ce_death_mult dummy

scoreboard objectives add gm4_ce_sleep custom:sleep_in_bed
scoreboard objectives add gm4_ce_last_sleep dummy

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
scoreboard players set #11 gm4_ce_data 11
scoreboard players set #13 gm4_ce_data 13
scoreboard players set #14 gm4_ce_data 14
scoreboard players set #15 gm4_ce_data 15
scoreboard players set #17 gm4_ce_data 17
scoreboard players set #21 gm4_ce_data 21
scoreboard players set #25 gm4_ce_data 25
scoreboard players set #30 gm4_ce_data 30
scoreboard players set #35 gm4_ce_data 35
scoreboard players set #40 gm4_ce_data 40
scoreboard players set #50 gm4_ce_data 50
scoreboard players set #64 gm4_ce_data 64
scoreboard players set #75 gm4_ce_data 75
scoreboard players set #100 gm4_ce_data 100
scoreboard players set #6000 gm4_ce_data 6000

# start clocks
schedule function gm4_combat_expanded:tick 1t
schedule function gm4_combat_expanded:main 2t
schedule function gm4_combat_expanded:slow_clock 3t

#$moduleUpdateList
