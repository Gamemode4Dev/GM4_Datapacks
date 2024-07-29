# process player
# @s = online player
# at unspecified
# run from clocks/player_submain

# also count player kills as kills
scoreboard players operation @s gm4_ce_kill += @s gm4_ce_kill2

# natural regen & armor
tag @s remove gm4_ce_sustain_active
execute if score $natural_regen gm4_ce_data matches 0 unless score @s[tag=!gm4_ce_frozen,scores={gm4_ce_hunger=18..}] gm4_ce_combat_regen_timer matches 1.. run function gm4_combat_expanded:player/health/regen_combat_health
execute if score $natural_regen gm4_ce_data matches 0 unless score @s[tag=!gm4_ce_frozen,scores={gm4_ce_hunger=18..,gm4_ce_fast_regen_health=1..}] gm4_ce_fast_regen_timer matches 1.. run function gm4_combat_expanded:player/health/regen_fast_health

# | Combat Expanded Armor (expansion pack, run from here to keep in sync)
execute if score combat_expanded_armor gm4_modules matches 1 run function gm4_combat_expanded_armor:call/process_player

# heal players if they have stored health
execute if score @s gm4_ce_healstore matches 1.. run function gm4_combat_expanded:player/health/heal/heal_calc

# process player sleeping
execute if score @s gm4_ce_sleep matches 1.. at @s run function gm4_combat_expanded:player/home/detect_sleep

# if player has armor use new damage calculation
scoreboard players reset @s gm4_ce_damage_resisted
effect give @s[scores={gm4_ce_armor=1..}] resistance 2 255 true
scoreboard players remove @s[scores={gm4_ce_armor_reduction_timer=1..}] gm4_ce_armor_reduction_timer 1
execute if score @s[tag=gm4_ce_armor_reduced] gm4_ce_armor_reduction_timer matches 0 run function gm4_combat_expanded:player/health/regain_armor

# DEV: trigger for players with `gm4_ce_dev` tag
execute if entity @s[tag=gm4_ce_dev] at @s as @e[type=#gm4_combat_expanded:modify,limit=1,sort=nearest] run function gm4_combat_expanded:debug/dont_run/dev
