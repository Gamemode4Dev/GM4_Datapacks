execute unless score survival_refightalized gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Survival Refightalized"}
execute unless score survival_refightalized gm4_earliest_version < survival_refightalized gm4_modules run scoreboard players operation survival_refightalized gm4_earliest_version = survival_refightalized gm4_modules
scoreboard players set survival_refightalized gm4_modules 1

# scoreboards
scoreboard objectives add gm4_sr_data dummy
scoreboard objectives add gm4_sr_config dummy

scoreboard objectives add gm4_sr_mob.difficulty dummy
scoreboard objectives add gm4_sr_mob.damage_cap dummy

scoreboard objectives add gm4_sr_health.restoration dummy
scoreboard objectives add gm4_sr_health.regeneration_timer dummy
scoreboard objectives add gm4_sr_health.absorption_reduction_timer dummy

scoreboard objectives add gm4_sr_stat.current_health dummy
scoreboard objectives add gm4_sr_stat.max_health dummy
scoreboard objectives add gm4_sr_stat.health_percentage dummy
scoreboard objectives add gm4_sr_stat.current_absorption dummy
scoreboard objectives add gm4_sr_stat.max_absorption dummy

scoreboard objectives add gm4_sr_stat.armor_recharge_change dummy
scoreboard objectives add gm4_sr_stat.regeneration_rate_change dummy

scoreboard objectives add gm4_sr_stat.hunger food
scoreboard objectives add gm4_sr_stat.damage_taken custom:damage_taken
scoreboard objectives add gm4_sr_stat.damage_absorbed custom:damage_absorbed
scoreboard objectives add gm4_sr_stat.damage_resisted custom:damage_resisted
scoreboard objectives add gm4_sr_stat.damage_blocked custom:damage_blocked_by_shield
scoreboard objectives add gm4_sr_stat.armor armor
scoreboard objectives add gm4_sr_stat.deaths deathCount

scoreboard objectives add gm4_sr_armor.tier dummy
scoreboard objectives add gm4_sr_armor.reduction dummy
scoreboard objectives add gm4_sr_armor.reduction_timer dummy
scoreboard objectives add gm4_sr_armor.hit_cooldown dummy

scoreboard objectives add gm4_sr_arrow.fire_delay dummy
scoreboard objectives add gm4_sr_arrow.fire_delay_left dummy
scoreboard objectives add gm4_sr_arrow.damage_change dummy

scoreboard objectives add gm4_sr_shield.spam_detection dummy
scoreboard objectives add gm4_sr_shield.use_ticks dummy
scoreboard objectives add gm4_sr_shield.timer dummy

# configs
execute unless score $config_version gm4_sr_config matches 2.. run scoreboard players set $natural_regen gm4_sr_config 1
execute unless score $config_version gm4_sr_config matches 2.. run scoreboard players set $combat_regen_timer gm4_sr_config 1250
execute unless score $config_version gm4_sr_config matches 2.. run scoreboard players set $rapid_regen_timer gm4_sr_config 250
execute unless score $config_version gm4_sr_config matches 2.. run scoreboard players set $armor_recharge_timer gm4_sr_config 500
scoreboard players set $config_version gm4_sr_data 2

# swap natural regeneration to module's system
execute unless score $natural_regen_disabled gm4_sr_data matches 1 run gamerule natural_health_regeneration false
execute unless score $natural_regen_disabled gm4_sr_data matches 1 run data modify storage gm4:log queue append value {type:"text",message:{"text":"[INFO] Survival Refightalized changed gamerule natural_health_regeneration to false"}}
scoreboard players set $natural_regen_disabled gm4_sr_data 1
execute store result score $naturalregeneration gm4_sr_data run gamerule natural_health_regeneration
execute if score $natural_regen gm4_sr_config matches 1 if score $naturalregeneration gm4_sr_data matches 1 run data modify storage gm4:log queue append value {type:"text",message:[{"text":"[WARN]","color":"red"},{"text":" Survival Refightalized requires minecraft:natural_health_regeneration to be false, but it is true. ","color":"white"},{"text":"click here to fix","color":"red","clickEvent":{"action":"suggest_command","value":"/gamerule natural_health_regeneration false"}}]}

# constants
scoreboard players set #-128 gm4_sr_data -128
scoreboard players set #0 gm4_sr_data 0
scoreboard players set #1 gm4_sr_data 1
scoreboard players set #2 gm4_sr_data 2
scoreboard players set #5 gm4_sr_data 5
scoreboard players set #8 gm4_sr_data 8
scoreboard players set #10 gm4_sr_data 10
scoreboard players set #60 gm4_sr_data 60
scoreboard players set #80 gm4_sr_data 80
scoreboard players set #100 gm4_sr_data 100
scoreboard players set #1024 gm4_sr_data 1024

# start clocks
schedule function gm4_survival_refightalized:tick 1t
schedule function gm4_survival_refightalized:main 2t
schedule function gm4_survival_refightalized:slow_clock 3t
