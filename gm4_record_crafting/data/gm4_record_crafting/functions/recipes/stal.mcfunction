# called from gm4_record_crafting:check_recipes

# place disc
loot replace block ~ ~ ~ container.0 loot gm4_record_crafting:crafting/stal

# set flags
tag @a[distance=..4,gamemode=!spectator] add gm4_crafted_record_stal
