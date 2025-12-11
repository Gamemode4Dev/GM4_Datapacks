# process blazing elite
# @s = blazing elite
# at @s
# run from mob/process/elite/check_type

scoreboard players set $has_target gm4_mu_data 0
execute on target if entity @s[type=player] run scoreboard players set $has_target gm4_mu_data 1
execute if score $has_target gm4_mu_data matches 1 run scoreboard players add @s gm4_mu_timer 1
execute if score $has_target gm4_mu_data matches 0 run scoreboard players set @s[scores={gm4_mu_timer=3..5}] gm4_mu_timer 6
scoreboard players set @s[scores={gm4_mu_timer=10..}] gm4_mu_timer 0

execute if score @s gm4_mu_timer matches 3 anchored eyes positioned ^ ^-0.25 ^ on target facing entity @s eyes rotated ~ -75 summon block_display run function gm4_monsters_unbound:mob/process/elite/blazing/init_flare
execute if score @s[type=#gm4_monsters_unbound:zombie_types] gm4_mu_timer matches 4 anchored eyes positioned ^ ^-0.25 ^ on target facing entity @s eyes rotated ~90 -75 summon block_display run function gm4_monsters_unbound:mob/process/elite/blazing/init_flare
execute if score @s[type=#gm4_monsters_unbound:zombie_types] gm4_mu_timer matches 5 anchored eyes positioned ^ ^-0.25 ^ on target facing entity @s eyes rotated ~-90 -75 summon block_display run function gm4_monsters_unbound:mob/process/elite/blazing/init_flare
