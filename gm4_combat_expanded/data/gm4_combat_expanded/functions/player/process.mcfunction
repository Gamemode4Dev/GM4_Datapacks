# process player
# @s = online player
# at unspecified
# run from clocks/player_submain

# process player deaths
execute if score @s[scores={gm4_ce_deaths=1..}] gm4_ce_alivetime matches ..16 run function gm4_combat_expanded:player/process_death

# also count player kills as kills
scoreboard players operation @s gm4_ce_kill += @s gm4_ce_kill2

# natural regen
tag @s remove gm4_ce_sustain_active
scoreboard players set @s[scores={gm4_ce_natural_regen_damage=4..,gm4_ce_kill=1..}] gm4_ce_natural_regen_damage 3
execute if score $natural_regen gm4_ce_data matches 0 unless score @s[scores={gm4_ce_hunger=18..},tag=!gm4_ce_pause_nat_regen,predicate=!gm4_combat_expanded:technical/poisoned] gm4_ce_natural_regen_damage matches 1.. run function gm4_combat_expanded:player/regen/check
tag @s remove gm4_ce_pause_nat_regen

# check for archer armor
tag @s[tag=gm4_ce_wearing_archer,predicate=!gm4_combat_expanded:modified_armor/archer] remove gm4_ce_wearing_archer
execute if entity @s[tag=!gm4_ce_wearing_archer,predicate=gm4_combat_expanded:modified_armor/archer] run function gm4_combat_expanded:armor/modifier/type/archer/activate

# remove husk sprint score if player didn't sprint for too long
execute unless score @s gm4_ce_sprinting matches 1.. run scoreboard players add @s[scores={gm4_ce_t_sprinting=1..}] gm4_ce_sprinting_timeout 1
scoreboard players reset @s[scores={gm4_ce_sprinting_timeout=3..,gm4_ce_t_sprinting=1..}] gm4_ce_t_sprinting
scoreboard players reset @s gm4_ce_husk_pieces

# remove tags
tag @s remove gm4_ce_beacon_active
tag @s remove gm4_ce_linked
execute if entity @s[tag=gm4_ce_immune_active] run function gm4_combat_expanded:player/clear_immunities

# process armor
execute if predicate gm4_combat_expanded:modified_armor/wearing run function gm4_combat_expanded:armor/process

# shield players if they have stored shield
execute if score @s gm4_ce_absorp matches 1.. run function gm4_combat_expanded:player/shield/prep
# heal players if they have stored health
execute if score @s gm4_ce_healstore matches 1.. run function gm4_combat_expanded:player/heal/heal_calc

# process player sleeping
execute if score @s gm4_ce_sleep matches 1.. at @s run function gm4_combat_expanded:player/home/detect_sleep

# remove second wind tag if armor is taken off
tag @s[tag=gm4_ce_second_wind.active,predicate=!gm4_combat_expanded:modified_armor/second_wind] remove gm4_ce_second_wind.active

# DEV: trigger for players with `gm4_ce_dev` tag
execute if entity @s[tag=gm4_ce_dev] at @s as @e[type=#gm4_combat_expanded:modify,limit=1,sort=nearest] run function gm4_combat_expanded:debug/dont_run/dev 
