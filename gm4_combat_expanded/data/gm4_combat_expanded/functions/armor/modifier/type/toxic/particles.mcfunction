# particles for toxic aura activating
# @s = toxic aura marker
# at @s
# run from armor/modifier/type/toxic/activate

scoreboard players add @s gm4_ce_data 1
particle ambient_entity_effect ^ ^ ^-1 0.306 0.576 0.192 1 0 normal
tp @s ~ ~ ~ ~15 ~

kill @s[scores={gm4_ce_data=24..}]
execute if score @s gm4_ce_data matches ..23 at @s run function gm4_combat_expanded:armor/modifier/type/toxic/particles
