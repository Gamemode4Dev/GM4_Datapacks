# check if player can get some healing
# @s = player to regenerate
# at unspecified
# run from player/process

function gm4_survival_refightalized:player/calculate_hp
execute if score @s gm4_sr_health.current < @s gm4_sr_health.max run scoreboard players set @s gm4_sr_combat_regen_timer 75
scoreboard players add @s[scores={gm4_sr_combat_regen_timer=75}] gm4_sr_healstore 1
