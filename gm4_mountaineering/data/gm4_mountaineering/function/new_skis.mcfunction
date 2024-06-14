# Creates new skis upon correct recipe detection
# @s = custom crafter with correct recipe
# run from check_recipes

scoreboard players set $crafted gm4_crafting 1

# Create skis in custom crafter
item modify block ~ ~ ~ container.4 gm4_mountaineering:skis
item replace block ~ ~ ~ container.0 with minecraft:air
item replace block ~ ~ ~ container.2 with minecraft:air
item replace block ~ ~ ~ container.3 with minecraft:air
item replace block ~ ~ ~ container.5 with minecraft:air
item replace block ~ ~ ~ container.6 with minecraft:air
item replace block ~ ~ ~ container.8 with minecraft:air
