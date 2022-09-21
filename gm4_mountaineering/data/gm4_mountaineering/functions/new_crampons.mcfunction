# Creates new crampons upon correct recipe detection
# @s = custom crafter with correct recipe
# run from check_recipes

# Preserve existing item data for provided leather boots
data modify storage gm4_mountaineering:temp crampons_item set from storage gm4_custom_crafters:temp/crafter Items[0]

# Create crampons in custom crafter
loot replace block ~ ~ ~ container.0 loot gm4_mountaineering:crafting/crampons

# Remove temp-stored leather boots from stored data
data remove storage gm4_mountaineering:temp crampons_item
