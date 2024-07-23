# slow players hit with slowing attack
# @s = player that was hit
# at unspecified
advancement revoke @s only gm4_combat_expanded:damaged/attack_effect/slowing

execute if entity @s[tag=gm4_ce_immune_slowness] run return 0

scoreboard players set $slowness_level gm4_ce_data -1
execute if data entity @s active_effects[{id:"minecraft:slowness"}] store result score $slowness_level gm4_ce_data run data get entity @s active_effects[{id:"minecraft:slowness"}].amplifier
execute store result storage gm4_combat_expanded:temp slowness.level int 1 run scoreboard players add $slowness_level gm4_ce_data 1

execute unless score $slowness_level gm4_ce_data matches 6.. run function gm4_combat_expanded:effect/freeze/stack_slow with storage gm4_combat_expanded:temp slowness
execute if score $slowness_level gm4_ce_data matches 6.. run function gm4_combat_expanded:effect/freeze/apply_from_slow

data remove storage gm4_combat_expanded:temp slowness
