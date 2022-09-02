# Creates new poles upon correct recipe detection
# @s = custom crafter with correct recipe
# run from check_recipes

# Preserve existing item data for provided end rod
data modify storage gm4_mountaineering:temp poles_item set from storage gm4_custom_crafters:temp/crafter Items[0]

# Create skis in custom crafter
loot replace block ~ ~ ~ container.0 loot gm4_mountaineering:crafting/poles

# Remove temp-stored iron boots from stored data
data remove storage gm4_mountaineering:temp poles_item