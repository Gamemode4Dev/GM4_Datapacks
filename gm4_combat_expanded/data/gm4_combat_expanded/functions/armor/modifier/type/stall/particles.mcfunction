# particles for stall aura activating
# @s = stall aura marker
# at @s
# run from armor/modifier/type/stall/activate

scoreboard players add @s gm4_ce_data 1
particle ambient_entity_effect ^ ^ ^-1 0.600 0.271 0.227 1 0 normal
particle ambient_entity_effect ^0.1 ^-0.1 ^-1.5 0.600 0.271 0.227 1 0 normal
particle ambient_entity_effect ^-0.1 ^0.1 ^-2 0.600 0.271 0.227 1 0 normal
tp @s ~ ~ ~ ~15 ~

kill @s[scores={gm4_ce_data=24..}]
execute if score @s gm4_ce_data matches ..23 at @s run function gm4_combat_expanded:armor/modifier/type/stall/particles
