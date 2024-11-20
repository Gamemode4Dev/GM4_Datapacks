# called from gm4_record_crafting:check_recipes

scoreboard players set $crafted gm4_crafting 1

# place disc
loot replace block ~ ~ ~ container.0 loot gm4_record_crafting:crafting/11

# grant advancement criteria
advancement grant @a[distance=..4,gamemode=!spectator] only gm4:record_crafting craft_music_disc_11
