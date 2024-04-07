# Creates new crampons upon correct recipe detection
# @s = custom crafter with correct recipe
# run from check_recipes

scoreboard players set $crafted gm4_crafting 1

# Create crampons in custom crafter
# TODO 1.20.5: check if this fails when crafting in the bottom two rows
item modify block ~ ~ ~ container.1 gm4_mountaineering:crampons
item replace block ~ ~ ~ container.3 with minecraft:air
item replace block ~ ~ ~ container.4 with minecraft:air
item replace block ~ ~ ~ container.5 with minecraft:air
