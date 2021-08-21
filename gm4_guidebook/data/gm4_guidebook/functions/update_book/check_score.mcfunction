# checks if the score is -1 to give the master guidebook
# @s = player who used the trigger with the book in their hand
# located at world spawn
# run from gm4_guidebook:trigger/mainhand
# and from gm4_guidebook:trigger/offhand

# copy modules into temp storage to iterate through
data modify storage gm4_guidebook:temp_analyze modules set from storage gm4_guidebook:pre_analyze modules

# set the loot table for the specific guide book
scoreboard players set $count gm4_guide 0
execute if score @s gm4_guide matches -1 run data modify storage gm4_guidebook:temp LootTable set value "gm4_guidebook:items/guidebook"
execute unless score @s gm4_guide matches -1 run function gm4_guidebook:replace_book/match_id
