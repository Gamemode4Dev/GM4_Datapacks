# check if player can get some healing
# @s = player to regenerate
# at unspecified
# run from player/process

function gm4_survival_refightalized:player/calculate_hp

execute unless score @s gm4_sr_health.current < @s gm4_sr_health.max run return run scoreboard players set @s gm4_sr_fast_regen_health 0
execute if score @s[predicate=gm4_survival_refightalized:modified_armor/half] gm4_sr_health.current >= @s gm4_sr_health.max_half run return 0

scoreboard players add @s gm4_sr_healstore 1
scoreboard players remove @s gm4_sr_fast_regen_health 1
