
# zombie villagers are not replaced
execute if entity @s[type=zombie_villager] run return run data remove entity @s attributes[{id:"minecraft:generic.max_health"}].modifiers[{id:"minecraft:leader_zombie_bonus"}]

scoreboard players set $modifier_picked gm4_ce_data 0

# temp remove
#TODO: spawn elites
data remove entity @s attributes[{id:"minecraft:generic.max_health"}].modifiers[{id:"minecraft:leader_zombie_bonus"}]
data modify entity @s IsBaby set value 0b
