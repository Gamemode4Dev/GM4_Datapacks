# raycast to find the dropper
# @s = marker ray
# located ^ ^ ^0.X, X = number of iterations
# run from gm4_custom_crafters:machine/craft_in_place/player_used_item

# check if a dropper is present
# | nested execute is needed as ANY dropper should match this search, but droppers with items in slot 4 or 7 should cancel the creation, not skip to the next raycast depth
execute if block ~ ~ ~ dropper align xyz unless entity @e[type=marker,tag=gm4_machine_marker,dx=0] run return run execute unless data block ~ ~ ~ Items[{Slot:4b}] unless data block ~ ~ ~ Items[{Slot:7b}] run function gm4_custom_crafters:machine/craft_in_place/create

# advance
scoreboard players remove $ray gm4_count 1
execute if score $ray gm4_count matches 0.. positioned ^ ^ ^0.013 run function gm4_custom_crafters:machine/craft_in_place/find_dropper
