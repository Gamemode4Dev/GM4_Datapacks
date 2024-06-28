# check if player can get some healing
# @s = player to regenerate
# at unspecified
# run from player/process

function gm4_combat_expanded:player/calculate_hp

execute unless score @s gm4_ce_health.current < @s gm4_ce_health.max run return run scoreboard players set @s gm4_ce_fast_regen_health 0
execute if score @s[predicate=gm4_combat_expanded:modified_armor/half] gm4_ce_health.current >= @s gm4_ce_health.max_half run return 0

scoreboard players add @s gm4_ce_healstore 1
scoreboard players remove @s gm4_ce_fast_regen_health 1
