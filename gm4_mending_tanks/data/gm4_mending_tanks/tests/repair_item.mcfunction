# @template gm4_liquid_tanks:test_setup

item replace block ~1 ~3 ~1 container.0 with minecraft:experience_bottle 10

await items block ~1 ~3 ~1 container.* minecraft:glass_bottle

item replace block ~1 ~3 ~1 container.0 with air

await delay 1s

item replace block ~1 ~3 ~1 container.0 with minecraft:elytra[damage=30,enchantments={mending:1}]

await items block ~1 ~3 ~1 container.0 minecraft:elytra[damage=0]
