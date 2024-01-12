# check if player can get some healing
# @s = player to regenerate
# at unspecified
# run from player/process

function gm4_combat_expanded:player/calculate_hp
execute store success score $wearing_half gm4_ce_data if score @s[predicate=gm4_combat_expanded:modified_armor/half] gm4_ce_health >= $half_health gm4_ce_data
execute if score @s gm4_ce_health < $max_health gm4_ce_data unless score $wearing_half gm4_ce_data matches 1 run scoreboard players add @s gm4_ce_healstore 1
scoreboard players set @s[scores={gm4_ce_healstore=1..}] gm4_ce_natural_regen_damage 2
