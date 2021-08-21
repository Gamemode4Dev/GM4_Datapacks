# runs commands based on the trigger
# @s = player who used the trigger with the book in their offhand
# located at world spawn
# run from gm4_guidebook:trigger/check_book

# check the score of the trigger (gm4_guide)
function gm4_guidebook:replace_book/check_score

# move item from storage to entity
summon vex ~ -2050 ~ {CustomName:'"gm4_guidebook_storage"',Tags:["gm4_guidebook_storage"],DeathLootTable:"minecraft:empty",NoAI:1b}
data modify entity @e[type=vex,tag=gm4_guidebook_storage,limit=1] DeathLootTable set from storage gm4_guidebook:temp LootTable

# insert into offhand
execute store result score $count gm4_guide run data get entity @s Inventory[{Slot:-106b}].Count
loot replace entity @s weapon.offhand kill @e[type=vex,tag=gm4_guidebook_storage,limit=1]
item modify entity @s weapon.offhand gm4_guidebook:restore_count

# add pages
execute if score @s gm4_guide matches -1 run function gm4_guidebook:analyze_storage/populate_offhand
execute unless score @s gm4_guide matches -1 run item modify entity @s weapon.offhand gm4_guidebook:page_library/offhand
playsound minecraft:item.armor.equip_leather block @s ~ ~ ~ 1 1.4

# clean up
kill @e[type=vex,tag=gm4_guidebook_storage,limit=1]
data remove storage gm4_guidebook:temp LootTable
data remove storage gm4_guidebook:temp_analyze modules
