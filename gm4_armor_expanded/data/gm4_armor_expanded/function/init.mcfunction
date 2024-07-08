execute unless score armor_expanded gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Armor Expanded"}
execute unless score armor_expanded gm4_earliest_version < armor_expanded gm4_modules run scoreboard players operation armor_expanded gm4_earliest_version = armor_expanded gm4_modules
scoreboard players set armor_expanded gm4_modules 1

# reset all links
data modify storage gm4_armor_expanded:data active_links set value [{id:-1,name:{"translate":"item.gm4.armor_expanded.name.link","fallback":"Unlinked %s","with":[{"translate":"item.minecraft.iron_chestplate","italic":false}],"italic":false,"color":"light_purple"}}]

# scoreboards
scoreboard objectives add gm4_ae_id dummy
scoreboard objectives add gm4_ae_difficult dummy {"text":"GM4 Armor Expanded: Difficulty"}
scoreboard objectives add gm4_ae_difficult.mob dummy
scoreboard objectives add gm4_ae_play_time dummy
scoreboard objectives add gm4_ae_death_mult dummy
scoreboard objectives add gm4_ae_since_last_death dummy
scoreboard objectives add gm4_ae_alivetime minecraft.custom:minecraft.time_since_death
scoreboard objectives add gm4_ae_deaths minecraft.custom:minecraft.deaths
scoreboard objectives add gm4_ae_data dummy
scoreboard objectives add gm4_ae_health.current dummy
scoreboard objectives add gm4_ae_health.max dummy
scoreboard objectives add gm4_ae_health.max_half dummy
scoreboard objectives add gm4_ae_hurt minecraft.custom:minecraft.damage_taken
scoreboard objectives add gm4_ae_kill minecraft.custom:minecraft.mob_kills
scoreboard objectives add gm4_ae_kill2 minecraft.custom:minecraft.player_kills
scoreboard objectives add gm4_ae_t_shield dummy
scoreboard objectives add gm4_ae_t_delay dummy
scoreboard objectives add gm4_ae_t_soothe dummy
scoreboard objectives add gm4_ae_t_wolf dummy
scoreboard objectives add gm4_ae_t_sprinting dummy
scoreboard objectives add gm4_ae_sprinting_timeout dummy
scoreboard objectives add gm4_ae_t_reactive dummy
scoreboard objectives add gm4_ae_absorp dummy
scoreboard objectives add gm4_ae_healstore dummy
scoreboard objectives add gm4_ae_absorped minecraft.custom:minecraft.damage_absorbed
scoreboard objectives add gm4_ae_hunger food
scoreboard objectives add gm4_ae_shielded_hit minecraft.used:minecraft.shield
scoreboard objectives add gm4_ae_sprinting minecraft.custom:minecraft.sprint_one_cm
scoreboard objectives add gm4_ae_generation dummy
scoreboard objectives add gm4_ae_swimming minecraft.custom:minecraft.swim_one_cm
scoreboard objectives add gm4_ae_used_bow minecraft.used:minecraft.bow
scoreboard objectives add gm4_ae_used_crossbow minecraft.used:minecraft.crossbow
scoreboard objectives add gm4_ae_combat_regen_timer dummy
scoreboard objectives add gm4_ae_death_mult dummy
scoreboard objectives add gm4_ae_second_wind dummy
scoreboard objectives add gm4_ae_link_id dummy
scoreboard objectives add gm4_ae_link_slot dummy
scoreboard objectives add gm4_ae_link_max_health dummy
scoreboard objectives add gm4_ae_sword_ring dummy
scoreboard objectives add gm4_ae_sword_ring.deg dummy
scoreboard objectives add gm4_ae_lightning_charge dummy
scoreboard objectives add gm4_ae_lightning_charge.timer dummy
scoreboard objectives add gm4_ae_lightning_charge.deg dummy
scoreboard objectives add gm4_ae_lightning_charge.striking dummy
scoreboard objectives add gm4_ae_sword_hit_triggered dummy
scoreboard objectives add gm4_ae_pierce_timer dummy
scoreboard objectives add gm4_ae_sleep custom:sleep_in_bed
scoreboard objectives add gm4_ae_sleep.version dummy
scoreboard objectives add gm4_ae_pvp_timer dummy
scoreboard objectives add gm4_ae_damage_cap dummy
scoreboard objectives add gm4_ae_relog minecraft.custom:minecraft.leave_game
scoreboard objectives add gm4_ae_burning.level dummy
scoreboard objectives add gm4_ae_burning.duration dummy
scoreboard objectives add gm4_ae_armor armor
scoreboard objectives add gm4_ae_horse.speed_level dummy
scoreboard objectives add gm4_ae_husk_pieces dummy
scoreboard objectives add gm4_ae_absorp_reduced_timer dummy

scoreboard objectives add gm4_ae_damage_taken minecraft.custom:minecraft.damage_taken
scoreboard objectives add gm4_ae_damage_absorbed minecraft.custom:minecraft.damage_absorbed
scoreboard objectives add gm4_ae_damage_resisted minecraft.custom:minecraft.damage_resisted
scoreboard objectives add gm4_ae_armor_reduced dummy
scoreboard objectives add gm4_ae_armor_reduction_timer dummy
scoreboard objectives add gm4_ae_fast_regen_health dummy
scoreboard objectives add gm4_ae_fast_regen_timer dummy

scoreboard objectives add gm4_ae_keep_tick dummy

# constants
scoreboard players set #-1 gm4_ae_data -1
scoreboard players set #0 gm4_ae_data 0
scoreboard players set #1 gm4_ae_data 1
scoreboard players set #2 gm4_ae_data 2
scoreboard players set #3 gm4_ae_data 3
scoreboard players set #4 gm4_ae_data 4
scoreboard players set #5 gm4_ae_data 5
scoreboard players set #7 gm4_ae_data 7
scoreboard players set #8 gm4_ae_data 8
scoreboard players set #10 gm4_ae_data 10
scoreboard players set #11 gm4_ae_data 11
scoreboard players set #13 gm4_ae_data 13
scoreboard players set #14 gm4_ae_data 14
scoreboard players set #15 gm4_ae_data 15
scoreboard players set #17 gm4_ae_data 17
scoreboard players set #21 gm4_ae_data 21
scoreboard players set #25 gm4_ae_data 25
scoreboard players set #30 gm4_ae_data 30
scoreboard players set #35 gm4_ae_data 35
scoreboard players set #40 gm4_ae_data 40
scoreboard players set #50 gm4_ae_data 50
scoreboard players set #64 gm4_ae_data 64
scoreboard players set #75 gm4_ae_data 75
scoreboard players set #80 gm4_ae_data 80
scoreboard players set #100 gm4_ae_data 100
scoreboard players set #125 gm4_ae_data 125
scoreboard players set #1000 gm4_ae_data 1000
scoreboard players set #1875 gm4_ae_data 1875
scoreboard players set #6000 gm4_ae_data 6000

# start clocks
schedule function gm4_armor_expanded:tick 1t
schedule function gm4_armor_expanded:main 2t
schedule function gm4_armor_expanded:slow_clock 3t

#$moduleUpdateList
