# @template gm4_lumos_shamir:test_dark
# @dummy ~1 ~1 ~1

setblock ~1 ~3 ~1 minecraft:glowstone

give @s diamond_pickaxe[custom_data={gm4_metallurgy:{has_shamir:1b,active_shamir:"lumos"}}]
give @s torch 16

await delay 1s

await block ~1 ~1 ~1 minecraft:air
