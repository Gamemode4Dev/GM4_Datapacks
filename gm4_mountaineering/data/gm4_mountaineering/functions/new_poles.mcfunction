# Creates new poles upon correct recipe detection
# @s = custom crafter with correct recipe
# run from check_recipes

# Preserve existing item data for provided tripwire hook
data modify storage gm4_mountaineering:temp poles_item set from storage gm4_custom_crafters:temp/crafter Items[0]

# Create poles in custom crafter
loot replace block ~ ~ ~ container.0 loot gm4_mountaineering:crafting/poles

# Remove temp-stored tripwire hook from stored data
data remove storage gm4_mountaineering:temp poles_item