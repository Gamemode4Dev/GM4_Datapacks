# process player
# @s = online player
# at unspecified
# run from player_submain

# natural regen & armor
tag @s remove gm4_sr_sustain_active
execute if score $natural_regen gm4_sr_data matches 0 unless score @s[tag=!gm4_sr_frozen,scores={gm4_sr_hunger=7..}] gm4_sr_combat_regen_timer matches 1.. run function gm4_survival_refightalized:player/health/regen_combat_health
execute if score $natural_regen gm4_sr_data matches 0 unless score @s[tag=!gm4_sr_frozen,scores={gm4_sr_fast_regen_health=1..}] gm4_sr_fast_regen_timer matches 1.. run function gm4_survival_refightalized:player/health/regen_fast_health

# heal players if they have stored health
execute if score @s gm4_sr_healstore matches 1.. run function gm4_survival_refightalized:player/health/heal/heal_calc

# process player sleeping
execute if score @s gm4_sr_sleep matches 1.. at @s run function gm4_survival_refightalized:player/detect_sleep

# if player has armor use new damage calculation
effect give @s[scores={gm4_sr_armor=1..}] resistance 2 255 true
scoreboard players remove @s[scores={gm4_sr_armor_reduction_timer=1..}] gm4_sr_armor_reduction_timer 1
execute if score @s[tag=gm4_sr_armor_reduced] gm4_sr_armor_reduction_timer matches 0 run function gm4_survival_refightalized:player/health/regain_armor

# DEV: trigger for players with `gm4_sr_dev` tag
execute if entity @s[tag=gm4_sr_dev] at @s as @e[type=#gm4_survival_refightalized:modify,limit=1,sort=nearest] run function gm4_survival_refightalized:debug/dont_run/dev
