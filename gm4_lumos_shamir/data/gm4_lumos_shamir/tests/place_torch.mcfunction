# @template gm4_lumos_shamir:test_dark
# @dummy ~1 ~1 ~1

give @s diamond_pickaxe[custom_data={gm4_metallurgy:{has_shamir:1b,active_shamir:"lumos"}}]

await delay 1s

give @s torch 16

await block ~1 ~1 ~1 torch

assert items entity @s container.* minecraft:torch[count=15]
