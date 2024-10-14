# process anything player related
# @s = unspecified
# at unspecified
# scheduled from main (8t)

## /!\
# This function is NOT run as the player because the order of some of these functions is important

# process player sleeping
execute as @a[scores={gm4_sr_stat.sleep_in_bed=1..},gamemode=!spectator] run function gm4_survival_refightalized:player/health/regeneration/detect_sleep

# natural regen
execute unless score $natural_regen gm4_sr_config matches -1 store result score $natural_regen gm4_sr_config run gamerule naturalRegeneration
execute if score $natural_regen gm4_sr_config matches 0 as @a[gamemode=!spectator] unless score @s gm4_sr_health.regeneration_timer matches 1.. unless score @s gm4_sr_stat.hunger matches ..6 run function gm4_survival_refightalized:player/health/regeneration/combat_health
execute if score $natural_regen gm4_sr_config matches 0 as @a[scores={gm4_sr_health.quick_regeneration_health=1..},gamemode=!spectator] unless score @s gm4_sr_health.quick_regeneration_timer matches 1.. run function gm4_survival_refightalized:player/health/regeneration/fast_health

# armor recharge timer
execute as @a[gamemode=!spectator,tag=gm4_sr_armor.reduction] run function gm4_survival_refightalized:player/armor/timer
# if player has armor use new damage calculation
effect give @a[gamemode=!spectator,scores={gm4_sr_stat.armor=1..}] resistance 2 255 true

# reset regeneration and armor recharge changes, can be set again from the function tag
scoreboard players set @a gm4_sr_stat.armor_recharge_change 0
scoreboard players set @a gm4_sr_stat.regeneration_rate_change 0

# function tag call for expansions to keep clocks sync'd
function #gm4_survival_refightalized:player_submain

# heal players if they have stored health
execute as @a[gamemode=!spectator,scores={gm4_sr_health.restoration=1..}] run function gm4_survival_refightalized:player/health/heal/heal_calc

# health regeneration timer
execute as @a[gamemode=!spectator,scores={gm4_sr_health.regeneration_timer=1..}] run function gm4_survival_refightalized:player/health/regeneration/timer
# quick regeneration timer
scoreboard players remove @a[gamemode=!spectator,scores={gm4_sr_health.quick_regeneration_timer=1..}] gm4_sr_health.quick_regeneration_timer 1

# DEV: trigger for players with `gm4_sr_dev` tag
execute if entity @s[tag=gm4_sr_dev] at @s as @e[type=#gm4_survival_refightalized:modify,limit=1,sort=nearest] run function gm4_survival_refightalized:debug/dont_run/dev
