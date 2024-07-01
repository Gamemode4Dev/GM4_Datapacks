# @template gm4:test_platform
# @dummy ~1 ~1 ~

give @s campfire
execute at @s run tp @s ~ ~ ~ facing ~ ~-1.5 ~1.5
dummy @s use block ~1 ~ ~1

await entity @s[nbt={active_effects:[{id:"minecraft:absorption",amplifier:1b}]}]
