# check if player can get some healing
# @s = player to regenerate
# at unspecified
# run from player/process
# run from armor/modifier/type/sustain/extra_regen

function gm4_combat_expanded:player/calculate_hp
execute store success score $wearing_half gm4_ce_data if score @s[predicate=gm4_combat_expanded:modified_armor/half] gm4_ce_health.current >= @s gm4_ce_health.max_half
execute if score @s gm4_ce_health.current < @s gm4_ce_health.max unless score $wearing_half gm4_ce_data matches 1 run scoreboard players set @s gm4_ce_combat_regen_timer 75
scoreboard players add @s[scores={gm4_ce_combat_regen_timer=75}] gm4_ce_healstore 1
