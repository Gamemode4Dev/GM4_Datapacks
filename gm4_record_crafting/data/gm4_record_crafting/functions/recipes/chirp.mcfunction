# called from gm4_record_crafting:recipe_check

# place disc
loot replace block ~ ~ ~ container.0 loot gm4_record_crafting:crafting/chirp

# set flags
tag @a[distance=..4,gamemode=!spectator] add gm4_crafted_record_chirp
