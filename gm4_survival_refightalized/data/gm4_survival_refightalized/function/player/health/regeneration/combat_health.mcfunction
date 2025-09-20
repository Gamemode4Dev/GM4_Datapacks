# check if player can get some healing
# @s = player to regenerate
# at unspecified
# run from player/health/regeneration/timer

function gm4_survival_refightalized:player/health/calculate_hp
execute unless score @s gm4_sr_stat.current_health < @s gm4_sr_stat.max_health run return 0

# base restore 10 (half a heart), call function tag for expansions
scoreboard players add @s gm4_sr_health.restoration 10
scoreboard players operation @s gm4_sr_health.regeneration_timer = $rapid_regen_timer gm4_sr_config
function #gm4_survival_refightalized:health_regeneration
