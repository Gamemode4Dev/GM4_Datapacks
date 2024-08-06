# check if player can get some healing
# @s = player to regenerate
# at unspecified
# run from player/process
# run from armor/modifier/type/sustain/extra_regen

function gm4_survival_refightalized:player/calculate_hp
execute store success score $wearing_half gm4_sr_data if score @s[predicate=gm4_survival_refightalized:modified_armor/half] gm4_sr_health.current >= @s gm4_sr_health.max_half
execute if score @s gm4_sr_health.current < @s gm4_sr_health.max unless score $wearing_half gm4_sr_data matches 1 run scoreboard players set @s gm4_sr_combat_regen_timer 75
scoreboard players add @s[scores={gm4_sr_combat_regen_timer=75}] gm4_sr_healstore 1
