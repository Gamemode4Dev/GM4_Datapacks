execute unless score survival_refightalized gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Survival Refightalized"}
execute unless score survival_refightalized gm4_earliest_version < survival_refightalized gm4_modules run scoreboard players operation survival_refightalized gm4_earliest_version = survival_refightalized gm4_modules
scoreboard players set survival_refightalized gm4_modules 1

# scoreboards
scoreboard objectives add gm4_sr_config dummy
scoreboard objectives add gm4_sr_mob_difficulty dummy
scoreboard objectives add gm4_sr_data dummy
scoreboard objectives add gm4_sr_timer dummy
scoreboard objectives add gm4_sr_health.current dummy
scoreboard objectives add gm4_sr_health.max dummy
scoreboard objectives add gm4_sr_health.percentage dummy
scoreboard objectives add gm4_sr_health.absorption dummy
scoreboard objectives add gm4_sr_health.absorption_max dummy
scoreboard objectives add gm4_sr_healstore dummy
scoreboard objectives add gm4_sr_hunger food
scoreboard objectives add gm4_sr_combat_regen_timer dummy
scoreboard objectives add gm4_sr_sleep custom:sleep_in_bed
scoreboard objectives add gm4_sr_damage_cap dummy
scoreboard objectives add gm4_sr_armor armor
scoreboard objectives add gm4_sr_absorp_reduced_timer dummy
scoreboard objectives add gm4_sr_tier dummy
scoreboard objectives add gm4_sr_last_slept_night dummy
scoreboard objectives add gm4_sr_damage_taken minecraft.custom:minecraft.damage_taken
scoreboard objectives add gm4_sr_damage_absorbed minecraft.custom:minecraft.damage_absorbed
scoreboard objectives add gm4_sr_damage_resisted minecraft.custom:minecraft.damage_resisted
scoreboard objectives add gm4_sr_armor_reduced dummy
scoreboard objectives add gm4_sr_armor_reduction_timer dummy
scoreboard objectives add gm4_sr_fast_regen_health dummy
scoreboard objectives add gm4_sr_fast_regen_timer dummy
scoreboard objectives add gm4_sr_proj_fire_delay dummy
scoreboard objectives add gm4_sr_proj_fire_delay_left dummy
scoreboard objectives add gm4_sr_proj_damage_change dummy

# configs
execute unless score $natural_regen gm4_sr_config matches -2147483648..2147483647 run scoreboard players set $natural_regen gm4_sr_config 1
execute unless score $combat_regen_timer gm4_sr_config matches -2147483648..2147483647 run scoreboard players set $combat_regen_timer gm4_sr_config 750
execute unless score $armor_recharge_timer gm4_sr_config matches -2147483648..2147483647 run scoreboard players set $armor_recharge_timer gm4_sr_config 250

# swap natural regeneration to module's system
execute unless score $natural_regen_disabled gm4_mu_data matches 1 run gamerule doInsomnia false
execute unless score $natural_regen_disabled gm4_mu_data matches 1 run data modify storage gm4:log queue append value {type:"text",message:'{"text":"[INFO] Survival Refightalized changed gamerule naturalRegeneration to false"}'}
scoreboard players set $natural_regen_disabled gm4_mu_data 1
execute store result score $naturalregeneration gm4_mu_data run gamerule doInsomnia
execute if score $natural_regen gm4_sr_config matches 1 if score $naturalregeneration gm4_mu_data matches 1 run data modify storage gm4:log queue append value {type:"text",message:'[{"text":"[WARN]","color":"red"},{"text":" Survival Refightalized requires naturalRegeneration to be false, but it is true. ","color":"white"},{"text":"click here to fix","color":"red","clickEvent":{"action":"suggest_command","value":"/gamerule naturalRegeneration false"}}]'}

# constants
scoreboard players set #-128 gm4_sr_data -128
scoreboard players set #-50 gm4_sr_data -50
scoreboard players set #0 gm4_sr_data 0
scoreboard players set #1 gm4_sr_data 1
scoreboard players set #2 gm4_sr_data 2
scoreboard players set #4 gm4_sr_data 4
scoreboard players set #5 gm4_sr_data 5
scoreboard players set #8 gm4_sr_data 8
scoreboard players set #10 gm4_sr_data 10
scoreboard players set #25 gm4_sr_data 25
scoreboard players set #50 gm4_sr_data 50
scoreboard players set #80 gm4_sr_data 80
scoreboard players set #100 gm4_sr_data 100
scoreboard players set #1000 gm4_sr_data 1000
scoreboard players set #1024 gm4_sr_data 1024

# start clocks
schedule function gm4_survival_refightalized:tick 1t
schedule function gm4_survival_refightalized:main 2t
schedule function gm4_survival_refightalized:slow_clock 3t
