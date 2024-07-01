# @template gm4:test_platform
# @dummy ~1 ~2 ~1
# @skyaccess

setblock ~1 ~ ~1 minecraft:dirt
setblock ~1 ~1 ~1 minecraft:big_dripleaf

await block ~1 ~1 ~1 minecraft:big_dripleaf[tilt=partial]

await delay 4t

setblock ~ ~1 ~1 minecraft:redstone_block

await entity @s[distance=7..]
