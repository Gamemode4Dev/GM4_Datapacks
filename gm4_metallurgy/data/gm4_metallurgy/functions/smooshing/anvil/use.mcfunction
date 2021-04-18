# Emulates vanilla anvil use. Anvils have a chance of losing 1 durability during smooshing.
# @s = varies; an item used in the smooshing process
# at align xyz in block over anvil
# run from gm4_metallurgy:smooshing/add_band/found_item and gm4_metallurgy:smooshing/remove_band/found_obsidian

# use anvil (12% chance)
execute if predicate gm4_metallurgy:smooshing/anvil_damage_chance positioned ~ ~-1 ~ run function gm4_metallurgy:smooshing/anvil/degrade

# sound
playsound minecraft:entity.zombie.attack_iron_door block @a[distance=..16] ~ ~ ~ 0.6 0.7
