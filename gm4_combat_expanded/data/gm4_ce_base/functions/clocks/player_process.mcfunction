# process player
# @s = online player
# at unspecified
# run from clocks/player_submain

# process player deaths
execute if score @s[scores={gm4_ce_deaths=1..}] gm4_ce_alivetime matches ..16 run function gm4_ce_base:player/process_death

# natural regen
tag @s remove gm4_ce_sustain_active
scoreboard players set @s[scores={gm4_ce_natural_regen_damage=4..,gm4_ce_kill=1..}] gm4_ce_natural_regen_damage 3
execute if score $natural_regen gm4_ce_data matches 0 unless score @s[scores={gm4_ce_hunger=18..},tag=!gm4_ce_pause_nat_regen,predicate=!gm4_combat_expanded:technical/poisoned] gm4_ce_natural_regen_damage matches 1.. run function gm4_ce_base:player/regen/check
tag @s remove gm4_ce_pause_nat_regen

# heal players if they have stored health
execute if score @s gm4_ce_healstore matches 1.. run function gm4_ce_base:player/heal/heal_calc

# process player sleeping
execute if score @s gm4_ce_sleep matches 1.. at @s run function gm4_ce_base:player/home/detect_sleep
