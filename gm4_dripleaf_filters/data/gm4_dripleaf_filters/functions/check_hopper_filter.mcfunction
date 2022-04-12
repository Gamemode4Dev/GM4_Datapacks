# @s item on a dripleaf with a hopper to the side of the dripleaf containing at least one item
# run from on_leaf

# store the item's ID in storage
data modify storage gm4_dripleaf_filters:cache itemCompare set from entity @s Item.id
# store the hopper's items in storage
data modify storage gm4_dripleaf_filters:cache hopperCompare set from block ^ ^-1 ^1 Items

# loop through the slots to see if any IDs match
scoreboard players set $filters_match gm4_dripleaf_filters 0
scoreboard players set $hopper_checked gm4_dripleaf_filters 0

# slot 0
execute store success score $items_are_different gm4_dripleaf_filters run data modify storage gm4_dripleaf_filters:cache hopperCompare[0].id set from storage gm4_dripleaf_filters:cache itemCompare
execute if score $items_are_different gm4_dripleaf_filters matches 0 run scoreboard players set $filters_match gm4_dripleaf_filters 1
execute unless score $filters_match gm4_dripleaf_filters matches 1 run data remove storage gm4_dripleaf_filters:cache hopperCompare[0]
# slot 1
execute unless score $filters_match gm4_dripleaf_filters matches 1 if data storage gm4_dripleaf_filters:cache {hopperCompare:[]} run scoreboard players set $hopper_checked gm4_dripleaf_filters 1
execute unless score $filters_match gm4_dripleaf_filters matches 1 unless score $hopper_checked gm4_dripleaf_filters matches 1 store success score $items_are_different gm4_dripleaf_filters run data modify storage gm4_dripleaf_filters:cache hopperCompare[0].id set from storage gm4_dripleaf_filters:cache itemCompare
execute unless score $filters_match gm4_dripleaf_filters matches 1 unless score $hopper_checked gm4_dripleaf_filters matches 1 if score $items_are_different gm4_dripleaf_filters matches 0 run scoreboard players set $filters_match gm4_dripleaf_filters 1
execute unless score $filters_match gm4_dripleaf_filters matches 1 unless score $hopper_checked gm4_dripleaf_filters matches 1 run data remove storage gm4_dripleaf_filters:cache hopperCompare[0]
# slot 2
execute unless score $filters_match gm4_dripleaf_filters matches 1 if data storage gm4_dripleaf_filters:cache {hopperCompare:[]} run scoreboard players set $hopper_checked gm4_dripleaf_filters 1
execute unless score $filters_match gm4_dripleaf_filters matches 1 unless score $hopper_checked gm4_dripleaf_filters matches 1 store success score $items_are_different gm4_dripleaf_filters run data modify storage gm4_dripleaf_filters:cache hopperCompare[0].id set from storage gm4_dripleaf_filters:cache itemCompare
execute unless score $filters_match gm4_dripleaf_filters matches 1 unless score $hopper_checked gm4_dripleaf_filters matches 1 if score $items_are_different gm4_dripleaf_filters matches 0 run scoreboard players set $filters_match gm4_dripleaf_filters 1
execute unless score $filters_match gm4_dripleaf_filters matches 1 unless score $hopper_checked gm4_dripleaf_filters matches 1 run data remove storage gm4_dripleaf_filters:cache hopperCompare[0]
# slot 3
execute unless score $filters_match gm4_dripleaf_filters matches 1 if data storage gm4_dripleaf_filters:cache {hopperCompare:[]} run scoreboard players set $hopper_checked gm4_dripleaf_filters 1
execute unless score $filters_match gm4_dripleaf_filters matches 1 unless score $hopper_checked gm4_dripleaf_filters matches 1 store success score $items_are_different gm4_dripleaf_filters run data modify storage gm4_dripleaf_filters:cache hopperCompare[0].id set from storage gm4_dripleaf_filters:cache itemCompare
execute unless score $filters_match gm4_dripleaf_filters matches 1 unless score $hopper_checked gm4_dripleaf_filters matches 1 if score $items_are_different gm4_dripleaf_filters matches 0 run scoreboard players set $filters_match gm4_dripleaf_filters 1
execute unless score $filters_match gm4_dripleaf_filters matches 1 unless score $hopper_checked gm4_dripleaf_filters matches 1 run data remove storage gm4_dripleaf_filters:cache hopperCompare[0]
# slot 4
execute unless score $filters_match gm4_dripleaf_filters matches 1 if data storage gm4_dripleaf_filters:cache {hopperCompare:[]} run scoreboard players set $hopper_checked gm4_dripleaf_filters 1
execute unless score $filters_match gm4_dripleaf_filters matches 1 unless score $hopper_checked gm4_dripleaf_filters matches 1 store success score $items_are_different gm4_dripleaf_filters run data modify storage gm4_dripleaf_filters:cache hopperCompare[0].id set from storage gm4_dripleaf_filters:cache itemCompare
execute unless score $filters_match gm4_dripleaf_filters matches 1 unless score $hopper_checked gm4_dripleaf_filters matches 1 if score $items_are_different gm4_dripleaf_filters matches 0 run scoreboard players set $filters_match gm4_dripleaf_filters 1
execute unless score $filters_match gm4_dripleaf_filters matches 1 unless score $hopper_checked gm4_dripleaf_filters matches 1 run data remove storage gm4_dripleaf_filters:cache hopperCompare[0]

execute if score $filters_match gm4_dripleaf_filters matches 1 run function gm4_dripleaf_filters:deposit_item
