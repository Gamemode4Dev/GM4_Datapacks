
scoreboard players remove @s[scores={gm4_ce_timer=1..}] gm4_ce_timer 1

scoreboard players set $has_target gm4_ce_data 0
execute unless score @s gm4_ce_timer matches 1.. on target run scoreboard players set $has_target gm4_ce_data 1

execute if score $has_target gm4_ce_data matches 1 run scoreboard players set @s gm4_ce_timer 5
execute if score $has_target gm4_ce_data matches 1 anchored eyes positioned ^ ^-0.25 ^ summon block_display run function gm4_combat_expanded:mob/process/elite/blazing/init_flare
