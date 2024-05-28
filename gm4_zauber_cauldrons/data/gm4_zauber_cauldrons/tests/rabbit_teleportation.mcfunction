# @template gm4:test_platform
# @dummy ~1 ~1 ~1

setblock ~ ~ ~1 netherrack
setblock ~ ~1 ~1 fire
setblock ~ ~2 ~1 water_cauldron[level=3]
setblock ~2 ~ ~1 netherrack
setblock ~2 ~1 ~1 fire
setblock ~2 ~2 ~1 water_cauldron[level=3]

give @s enchanted_book[stored_enchantments={protection:1}]
execute at @s run tp @s ~ ~ ~ facing ~1 ~ ~
await delay 1s
execute at @s run tp @s ~ ~ ~ facing ~-1 ~ ~
await delay 1s

await entity @s[advancements={gm4:zauber_cauldrons_create=true}]

setblock ~ ~2 ~1 cauldron
setblock ~2 ~2 ~1 cauldron
summon rabbit ~0.5 ~3 ~1.5

loot replace entity @s armor.feet loot gm4_zauber_cauldrons:items/armor/boots/speed_boost
loot replace entity @s armor.legs loot gm4_zauber_cauldrons:items/armor/leggings/speed_boost
loot replace entity @s armor.chest loot gm4_zauber_cauldrons:items/armor/chestplate/speed_boost
loot replace entity @s armor.head loot gm4_zauber_cauldrons:items/armor/helmet/speed_boost

await entity @s[advancements={gm4:zauber_cauldrons_rabbit=true}]

execute positioned ~2.5 ~2.5 ~1.5 run assert entity @e[type=rabbit,dx=0]
