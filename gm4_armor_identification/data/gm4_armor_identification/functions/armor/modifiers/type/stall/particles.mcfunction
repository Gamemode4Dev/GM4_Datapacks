# run from armor/modifiers/type/stall/activate
# @s = stall aura marker
# at @s

scoreboard players add @s gm4_ai_data 1
particle ambient_entity_effect ^ ^ ^-1 0.282 0.302 0.282 0 0 normal
particle ambient_entity_effect ^0.1 ^-0.1 ^-1.5 0.282 0.302 0.282 0 0 normal
particle ambient_entity_effect ^-0.1 ^0.1 ^-2 0.282 0.302 0.282 0 0 normal
tp @s ~ ~ ~ ~15 ~

kill @s[scores={gm4_ai_data=24..}]
execute if score @s gm4_ai_data matches ..23 at @s run function gm4_armor_identification:armor/modifiers/type/stall/particles
