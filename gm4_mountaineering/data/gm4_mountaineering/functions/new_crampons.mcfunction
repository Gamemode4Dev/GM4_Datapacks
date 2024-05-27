# Creates new crampons upon correct recipe detection
# @s = custom crafter with correct recipe
# run from check_recipes

scoreboard players set $crafted gm4_crafting 1

# Check in which slots the recipe is
execute if items block ~ ~ ~ container.1 minecraft:chainmail_boots run item modify block ~ ~ ~ container.1 gm4_mountaineering:crampons
execute if items block ~ ~ ~ container.1 minecraft:chainmail_boots run item replace block ~ ~ ~ container.3 with minecraft:air
execute if items block ~ ~ ~ container.1 minecraft:chainmail_boots run item replace block ~ ~ ~ container.4 with minecraft:air
execute if items block ~ ~ ~ container.1 minecraft:chainmail_boots run item replace block ~ ~ ~ container.5 with minecraft:air

execute if items block ~ ~ ~ container.4 minecraft:chainmail_boots run item modify block ~ ~ ~ container.4 gm4_mountaineering:crampons
execute if items block ~ ~ ~ container.4 minecraft:chainmail_boots run item replace block ~ ~ ~ container.6 with minecraft:air
execute if items block ~ ~ ~ container.4 minecraft:chainmail_boots run item replace block ~ ~ ~ container.7 with minecraft:air
execute if items block ~ ~ ~ container.4 minecraft:chainmail_boots run item replace block ~ ~ ~ container.8 with minecraft:air
