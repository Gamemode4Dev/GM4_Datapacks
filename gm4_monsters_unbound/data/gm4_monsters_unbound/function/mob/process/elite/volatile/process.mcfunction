# process volatile elite
# @s = volatile elite
# at @s
# run from mob/process/elite/check_type

scoreboard players set $has_target gm4_mu_data 0
execute on target if entity @s[type=player] run scoreboard players set $has_target gm4_mu_data 1
execute if score $has_target gm4_mu_data matches 0 run return 0

scoreboard players add @s gm4_mu_timer 1
execute if predicate {condition:"random_chance","chance":0.45} run scoreboard players add @s gm4_mu_timer 1

execute if score @s gm4_mu_timer matches 7..10 run particle block{block_state:"purple_glazed_terracotta"} ~ ~2 ~ 0 4 0 0.25 32
execute if score @s gm4_mu_timer matches 7..10 on target at @s summon marker run function gm4_monsters_unbound:mob/process/elite/volatile/pillar_location
scoreboard players set @s[scores={gm4_mu_timer=10..}] gm4_mu_timer 0
