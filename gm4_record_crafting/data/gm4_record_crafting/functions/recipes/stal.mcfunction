# called from gm4_record_crafting:recipe_check

# place disc
data merge storage gm4_custom_crafters:temp/crafter {Items:[{Slot:8,id:"music_disc_stal",Count:1b,tag:{gm4_custom_crafters:{multiplier:1}}}]}

# set flags
tag @a[distance=..4,gamemode=!spectator] add gm4_crafted_record_stal
scoreboard players set successful_record_craft gm4_slot_count 1
