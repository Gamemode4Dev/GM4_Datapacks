# process anything player related
# @s = unspecified
# at unspecified
# scheduled from main (8t)

## /!\
# This function is NOT run as the player because the order of some of these functions is important

# DEV: trigger for players with `gm4_sr_dev.damage_log` tag
execute as @a[tag=gm4_sr_dev.mob_stats] at @s as @e[type=#gm4_survival_refightalized:modify,limit=1,sort=nearest] run function gm4_survival_refightalized:debug/dont_run/dev

# process players that died
execute as @a[scores={gm4_sr_stat.deaths=1..}] run function gm4_survival_refightalized:player/death

# reset regeneration and armor recharge changes, can be set again from the function tag
scoreboard players set @a gm4_sr_stat.armor_recharge_change 0
scoreboard players set @a gm4_sr_stat.regeneration_rate_change 0

# function tag call for expansions to keep clocks sync'd
function #gm4_survival_refightalized:player_submain

# armor recharge timer
execute as @a[gamemode=!spectator,tag=gm4_sr_armor.reduction] run function gm4_survival_refightalized:player/armor/timer
# health regen timer
execute unless score $natural_regen gm4_sr_config matches -1 store result score $natural_regen gm4_sr_config run gamerule naturalRegeneration
execute if score $natural_regen gm4_sr_config matches 0 as @a[gamemode=!spectator] run function gm4_survival_refightalized:player/health/regeneration/timer

# if player has armor use new damage calculation
effect give @a[gamemode=!spectator,scores={gm4_sr_stat.armor=1..}] resistance 2 255 true

# heal players if they have stored health
execute as @a[gamemode=!spectator,scores={gm4_sr_health.restoration=1..}] run function gm4_survival_refightalized:player/health/heal/activate
