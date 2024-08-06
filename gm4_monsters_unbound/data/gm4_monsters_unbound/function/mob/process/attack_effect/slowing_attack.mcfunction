# slow players hit with slowing attack
# @s = player that was hit
# at unspecified
advancement revoke @s only gm4_monsters_unbound:damaged/attack_effect/slowing

execute if entity @s[tag=gm4_mu_immune_slowness] run return 0

scoreboard players set $slowness_level gm4_mu_data -1
execute if data entity @s active_effects[{id:"minecraft:slowness"}] store result score $slowness_level gm4_mu_data run data get entity @s active_effects[{id:"minecraft:slowness"}].amplifier
execute store result storage gm4_monsters_unbound:temp slowness.level int 1 run scoreboard players add $slowness_level gm4_mu_data 1

execute unless score $slowness_level gm4_mu_data matches 6.. run function gm4_monsters_unbound:effect/freeze/stack_slow with storage gm4_monsters_unbound:temp slowness
execute if score $slowness_level gm4_mu_data matches 6.. run function gm4_monsters_unbound:effect/freeze/apply_from_slow

data remove storage gm4_monsters_unbound:temp slowness
