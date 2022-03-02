# run from mobs/initiate
# @s = ghast
# at @s

# calculate stats based on difficulty
execute if score $difficulty gm4_ce_data matches 4..7 if predicate gm4_combat_evolved:technical/chance_5 if entity @s[tag=!gm4_ce_extra_mob] store success score $mob_extras gm4_ce_data run summon ghast ~ ~0.75 ~ {Tags:["gm4_ce_extra_mob"]}
execute if score $difficulty gm4_ce_data matches 8..10 if predicate gm4_combat_evolved:technical/chance_15 if entity @s[tag=!gm4_ce_extra_mob] store success score $mob_extras gm4_ce_data run summon ghast ~ ~0.75 ~ {Tags:["gm4_ce_extra_mob"]}
execute if score $difficulty gm4_ce_data matches 11.. if entity @s[tag=!gm4_ce_extra_mob] run summon ghast ~ ~0.75 ~ {Tags:["gm4_ce_extra_mob"]}
execute if score $difficulty gm4_ce_data matches 11.. if predicate gm4_combat_evolved:technical/chance_15 if entity @s[tag=!gm4_ce_extra_mob] store success score $mob_extras gm4_ce_data run summon ghast ~ ~1.5 ~ {Tags:["gm4_ce_extra_mob"]}
