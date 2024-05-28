# @s = gm4_custom_crafter (with boots of ostara recipe)
# Run from check_recipes

scoreboard players set $crafted gm4_crafting 1

scoreboard players reset $boa_custom_name gm4_crafting
execute store success score $boa_custom_name gm4_crafting if items block ~ ~ ~ container.4 *[custom_name]

scoreboard players reset $boa_flippers gm4_crafting
execute store success score $boa_flippers gm4_crafting if items block ~ ~ ~ container.4 *[custom_data~{gm4_scuba_gear:{item:"flippers"}}]

item modify block ~ ~ ~ container.4 gm4_boots_of_ostara:boots_of_ostara
item replace block ~ ~ ~ container.1 with minecraft:air
item replace block ~ ~ ~ container.3 with minecraft:air
item replace block ~ ~ ~ container.5 with minecraft:air
item replace block ~ ~ ~ container.7 with minecraft:bucket
