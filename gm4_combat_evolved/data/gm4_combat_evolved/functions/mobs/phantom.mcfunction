# run from mobs/initiate
# @s = phantom
# at @s

# calculate stats based on difficulty
execute if score $difficulty gm4_ce_data matches ..3 run attribute @s generic.max_health modifier add 54baf755-966a-451c-a7c3-0aefc1dfd8ee "gm4_ce_modifier_weaker_phantom" -0.5 multiply
execute if score $difficulty gm4_ce_data matches 4.. run scoreboard players add $mob_damage gm4_ce_data 2
execute if score $difficulty gm4_ce_data matches 4.. if predicate gm4_combat_evolved:technical/chance_5 run data modify entity @s Size set value 2
execute if score $difficulty gm4_ce_data matches 11.. if entity @s[tag=!gm4_ce_extra_mob] store success score $mob_extras gm4_ce_data run summon phantom ~1 ~1.5 ~3 {Tags:["gm4_ce_extra_mob"]}
execute if score $difficulty gm4_ce_data matches 11.. if entity @s[tag=!gm4_ce_extra_mob] store success score $mob_extras gm4_ce_data run summon phantom ~3 ~2.5 ~1 {Tags:["gm4_ce_extra_mob"],Size:1}
execute if score $difficulty gm4_ce_data matches 11.. if entity @s[tag=!gm4_ce_extra_mob] store success score $mob_extras gm4_ce_data run summon phantom ~-2 ~0.5 ~-2 {Tags:["gm4_ce_extra_mob"],Size:1}

# set modifiers
function gm4_combat_evolved:mobs/modifiers/prep
