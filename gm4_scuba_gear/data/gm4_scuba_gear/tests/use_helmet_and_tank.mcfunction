# @template gm4:test_tube
# @dummy ~1.5 ~1 ~1.5

setblock ~1 ~1 ~1 water
setblock ~1 ~2 ~1 water
loot replace entity @s armor.head loot gm4_scuba_gear:items/scuba_helmet
loot replace entity @s armor.chest loot gm4_scuba_gear:items/scuba_tank

await entity @s[nbt={active_effects:[{id:"minecraft:conduit_power"}]}]

# remove tank
item replace entity @s armor.chest with air

await not entity @s[nbt={active_effects:[{id:"minecraft:conduit_power"}]}]

# readd tank
loot replace entity @s armor.chest loot gm4_scuba_gear:items/scuba_tank

await delay 1s

assert not entity @s[nbt={active_effects:[{id:"minecraft:conduit_power"}]}]

# refresh air
setblock ~1 ~2 ~1 air

await delay 1s

setblock ~1 ~2 ~1 water

await entity @s[nbt={active_effects:[{id:"minecraft:conduit_power"}]}]
