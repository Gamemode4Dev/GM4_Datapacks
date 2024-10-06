# process anything player related
# @s = unspecified
# at unspecified
# scheduled from main (8t)

# process player sleeping
execute as @a[scores={gm4_sr_sleep=1..},gamemode=!spectator] run function gm4_survival_refightalized:player/detect_sleep

# natural regen
execute unless score $natural_regen gm4_sr_config matches -1 store result score $natural_regen gm4_sr_config run gamerule naturalRegeneration
execute if score $natural_regen gm4_sr_config matches 0 as @a[scores={gm4_sr_hunger=7..},gamemode=!spectator] unless score @s gm4_sr_combat_regen_timer matches 1.. run function gm4_survival_refightalized:player/health/regen_combat_health
execute if score $natural_regen gm4_sr_config matches 0 as @a[scores={gm4_sr_fast_regen_health=1..},gamemode=!spectator] unless score @s gm4_sr_fast_regen_timer matches 1.. run function gm4_survival_refightalized:player/health/regen_fast_health

# if player has armor use new damage calculation
effect give @a[gamemode=!spectator,scores={gm4_sr_armor=1..}] resistance 2 255 true
scoreboard players remove @a[scores={gm4_sr_armor_reduction_timer=1..}] gm4_sr_armor_reduction_timer 10
execute as @a[gamemode=!spectator,tag=gm4_sr_armor_reduced,scores={gm4_sr_armor_reduction_timer=..0}] run function gm4_survival_refightalized:player/health/regain_armor

# function tag call for expansions to keep clocks sync'd
function #gm4_survival_refightalized:player_submain

# heal players if they have stored health
execute as @a[scores={gm4_sr_healstore=1..},gamemode=!spectator] run function gm4_survival_refightalized:player/health/heal/heal_calc

# timers
scoreboard players remove @a[scores={gm4_sr_combat_regen_timer=1..}] gm4_sr_combat_regen_timer 10
scoreboard players remove @a[scores={gm4_sr_fast_regen_timer=1..}] gm4_sr_fast_regen_timer 1

# DEV: trigger for players with `gm4_sr_dev` tag
execute if entity @s[tag=gm4_sr_dev] at @s as @e[type=#gm4_survival_refightalized:modify,limit=1,sort=nearest] run function gm4_survival_refightalized:debug/dont_run/dev
