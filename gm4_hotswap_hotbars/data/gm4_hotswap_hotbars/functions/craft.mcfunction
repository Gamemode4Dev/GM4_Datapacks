# crafts the hotswapper with random non stackable tag
# @s = custom crafter
# at @s
# run from gm4_hotswap_hotbars:check_recipes

# RNG
summon marker ~ ~ ~ {Tags:["gm4_hh_rng"]}
data modify storage gm4_hotswap_hotbars:temp UUID set from entity @e[type=marker,tag=gm4_hh_rng,distance=..0.1,limit=1] UUID[0]
kill @e[type=marker,tag=gm4_hh_rng,distance=..0.1]

# create item
loot replace block ~ ~ ~ container.0 loot gm4_hotswap_hotbars:crafting/hotswapper
data remove storage gm4_hotswap_hotbars:temp UUID
