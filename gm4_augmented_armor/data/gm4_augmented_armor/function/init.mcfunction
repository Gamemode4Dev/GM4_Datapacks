execute unless score augmented_armor gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Augmented Armor"}
execute unless score augmented_armor gm4_earliest_version < augmented_armor gm4_modules run scoreboard players operation augmented_armor gm4_earliest_version = augmented_armor gm4_modules
scoreboard players set augmented_armor gm4_modules 1

# reset all links
data modify storage gm4_augmented_armor:data active_links set value [{id:-1,name:{"translate":"item.gm4.augmented_armor.name.link","fallback":"Unlinked %s","with":[{"translate":"item.minecraft.iron_chestplate","italic":false}],"italic":false,"color":"light_purple"}}]

# scoreboards
scoreboard objectives add gm4_aa_difficult.mob dummy
scoreboard objectives add gm4_aa_play_time dummy
scoreboard objectives add gm4_aa_death_mult dummy
scoreboard objectives add gm4_aa_since_last_death dummy
scoreboard objectives add gm4_aa_alivetime minecraft.custom:minecraft.time_since_death
scoreboard objectives add gm4_aa_deaths minecraft.custom:minecraft.deaths
scoreboard objectives add gm4_aa_data dummy
scoreboard objectives add gm4_sr_health.current dummy
scoreboard objectives add gm4_sr_health.max dummy
scoreboard objectives add gm4_sr_health.max_half dummy
scoreboard objectives add gm4_aa_hurt minecraft.custom:minecraft.damage_taken
scoreboard objectives add gm4_aa_kill minecraft.custom:minecraft.mob_kills
scoreboard objectives add gm4_aa_kill2 minecraft.custom:minecraft.player_kills
scoreboard objectives add gm4_aa_t_shield dummy
scoreboard objectives add gm4_aa_t_delay dummy
scoreboard objectives add gm4_aa_t_soothe dummy
scoreboard objectives add gm4_aa_t_wolf dummy
scoreboard objectives add gm4_aa_t_sprinting dummy
scoreboard objectives add gm4_aa_sprinting_timeout dummy
scoreboard objectives add gm4_aa_t_reactive dummy
scoreboard objectives add gm4_aa_absorp dummy
scoreboard objectives add gm4_aa_healstore dummy
scoreboard objectives add gm4_aa_absorped minecraft.custom:minecraft.damage_absorbed
scoreboard objectives add gm4_aa_hunger food
scoreboard objectives add gm4_aa_shielded_hit minecraft.used:minecraft.shield
scoreboard objectives add gm4_aa_sprinting minecraft.custom:minecraft.sprint_one_cm
scoreboard objectives add gm4_aa_generation dummy
scoreboard objectives add gm4_aa_swimming minecraft.custom:minecraft.swim_one_cm
scoreboard objectives add gm4_aa_used_bow minecraft.used:minecraft.bow
scoreboard objectives add gm4_aa_used_crossbow minecraft.used:minecraft.crossbow
scoreboard objectives add gm4_aa_death_mult dummy
scoreboard objectives add gm4_aa_second_wind dummy
scoreboard objectives add gm4_aa_link_id dummy
scoreboard objectives add gm4_aa_link_slot dummy
scoreboard objectives add gm4_aa_link_max_health dummy
scoreboard objectives add gm4_aa_sword_ring dummy
scoreboard objectives add gm4_aa_sword_ring.deg dummy
scoreboard objectives add gm4_aa_lightning_charge dummy
scoreboard objectives add gm4_aa_lightning_charge.timer dummy
scoreboard objectives add gm4_aa_lightning_charge.deg dummy
scoreboard objectives add gm4_aa_lightning_charge.striking dummy
scoreboard objectives add gm4_aa_sword_hit_triggered dummy
scoreboard objectives add gm4_aa_pierce_timer dummy
scoreboard objectives add gm4_aa_sleep custom:sleep_in_bed
scoreboard objectives add gm4_aa_sleep.version dummy
scoreboard objectives add gm4_aa_pvp_timer dummy
scoreboard objectives add gm4_aa_damage_cap dummy
scoreboard objectives add gm4_aa_relog minecraft.custom:minecraft.leave_game
scoreboard objectives add gm4_aa_burning.level dummy
scoreboard objectives add gm4_aa_burning.duration dummy
scoreboard objectives add gm4_aa_armor armor
scoreboard objectives add gm4_aa_horse.speed_level dummy
scoreboard objectives add gm4_aa_husk_pieces dummy
scoreboard objectives add gm4_aa_absorp_reduced_timer dummy
scoreboard objectives add gm4_aa_in_combat_timer dummy

scoreboard objectives add gm4_aa_damage_taken minecraft.custom:minecraft.damage_taken
scoreboard objectives add gm4_aa_damage_absorbed minecraft.custom:minecraft.damage_absorbed
scoreboard objectives add gm4_aa_damage_resisted minecraft.custom:minecraft.damage_resisted
scoreboard objectives add gm4_aa_armor_reduced dummy
scoreboard objectives add gm4_aa_armor_reduction_timer dummy
scoreboard objectives add gm4_aa_fast_regen_health dummy
scoreboard objectives add gm4_aa_fast_regen_timer dummy

scoreboard objectives add gm4_aa_keep_tick dummy

# constants
scoreboard players set #-1 gm4_aa_data -1
scoreboard players set #0 gm4_aa_data 0
scoreboard players set #1 gm4_aa_data 1
scoreboard players set #2 gm4_aa_data 2
scoreboard players set #3 gm4_aa_data 3
scoreboard players set #4 gm4_aa_data 4
scoreboard players set #5 gm4_aa_data 5
scoreboard players set #7 gm4_aa_data 7
scoreboard players set #8 gm4_aa_data 8
scoreboard players set #10 gm4_aa_data 10
scoreboard players set #11 gm4_aa_data 11
scoreboard players set #13 gm4_aa_data 13
scoreboard players set #14 gm4_aa_data 14
scoreboard players set #15 gm4_aa_data 15
scoreboard players set #17 gm4_aa_data 17
scoreboard players set #21 gm4_aa_data 21
scoreboard players set #25 gm4_aa_data 25
scoreboard players set #30 gm4_aa_data 30
scoreboard players set #35 gm4_aa_data 35
scoreboard players set #40 gm4_aa_data 40
scoreboard players set #50 gm4_aa_data 50
scoreboard players set #64 gm4_aa_data 64
scoreboard players set #75 gm4_aa_data 75
scoreboard players set #80 gm4_aa_data 80
scoreboard players set #100 gm4_aa_data 100
scoreboard players set #125 gm4_aa_data 125
scoreboard players set #1000 gm4_aa_data 1000
scoreboard players set #1875 gm4_aa_data 1875
scoreboard players set #6000 gm4_aa_data 6000

# start clocks
schedule function gm4_augmented_armor:tick 1t
schedule function gm4_augmented_armor:slow_clock 1t

#$moduleUpdateList