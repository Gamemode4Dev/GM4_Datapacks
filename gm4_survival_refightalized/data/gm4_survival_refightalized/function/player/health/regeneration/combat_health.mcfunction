# check if player can get some healing
# @s = player to regenerate
# at unspecified
# run from player/process

function gm4_survival_refightalized:player/health/calculate_hp
execute unless score @s gm4_sr_stat.current_health < @s gm4_sr_stat.max_health run return 0

scoreboard players operation $set gm4_sr_health.regeneration_timer = $combat_regen_timer gm4_sr_config
scoreboard players add @s gm4_sr_health.restoration 10
function #gm4_survival_refightalized:combat_regeneration
scoreboard players operation @s gm4_sr_health.regeneration_timer > $set gm4_sr_health.regeneration_timer
