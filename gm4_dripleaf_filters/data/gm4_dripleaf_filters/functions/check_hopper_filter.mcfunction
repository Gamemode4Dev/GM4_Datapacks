# @s item on a dripleaf with a hopper to the side of the dripleaf containing at least one item
# run from on_leaf

# store the item's ID in storage
data modify storage gm4_dripleaf_filters:cache itemCompare set from entity @s Item.id
# store the hopper's items in storage
data modify storage gm4_dripleaf_filters:cache hopperCompare set from block ^ ^-1 ^1 Items

# loop through the slots to see if any IDs match
# slot 0
execute store success storage gm4_dripleaf_filters:cache itemsAreDifferent byte 1 run data modify storage gm4_dripleaf_filters:cache hopperCompare[0].id set from storage gm4_dripleaf_filters:cache itemCompare
execute if data storage gm4_dripleaf_filters:cache {itemsAreDifferent:0b} run tag @s add gm4_dripleaf_filters_match
execute unless entity @s[tag=gm4_dripleaf_filters_match] run data remove storage gm4_dripleaf_filters:cache hopperCompare[0]
# slot 1
execute unless entity @s[tag=gm4_dripleaf_filters_match] if data storage gm4_dripleaf_filters:cache {hopperCompare:[]} run tag @s add gm4_dripleaf_hopper_checked
execute unless entity @s[tag=gm4_dripleaf_filters_match] unless entity @s[tag=gm4_dripleaf_hopper_checked] store success storage gm4_dripleaf_filters:cache itemsAreDifferent byte 1 run data modify storage gm4_dripleaf_filters:cache hopperCompare[0].id set from storage gm4_dripleaf_filters:cache itemCompare
execute unless entity @s[tag=gm4_dripleaf_filters_match] unless entity @s[tag=gm4_dripleaf_hopper_checked] if data storage gm4_dripleaf_filters:cache {itemsAreDifferent:0b} run tag @s add gm4_dripleaf_filters_match
execute unless entity @s[tag=gm4_dripleaf_filters_match] unless entity @s[tag=gm4_dripleaf_hopper_checked] run data remove storage gm4_dripleaf_filters:cache hopperCompare[0]
# slot 2
execute unless entity @s[tag=gm4_dripleaf_filters_match] if data storage gm4_dripleaf_filters:cache {hopperCompare:[]} run tag @s add gm4_dripleaf_hopper_checked
execute unless entity @s[tag=gm4_dripleaf_filters_match] unless entity @s[tag=gm4_dripleaf_hopper_checked] store success storage gm4_dripleaf_filters:cache itemsAreDifferent byte 1 run data modify storage gm4_dripleaf_filters:cache hopperCompare[0].id set from storage gm4_dripleaf_filters:cache itemCompare
execute unless entity @s[tag=gm4_dripleaf_filters_match] unless entity @s[tag=gm4_dripleaf_hopper_checked] if data storage gm4_dripleaf_filters:cache {itemsAreDifferent:0b} run tag @s add gm4_dripleaf_filters_match
execute unless entity @s[tag=gm4_dripleaf_filters_match] unless entity @s[tag=gm4_dripleaf_hopper_checked] run data remove storage gm4_dripleaf_filters:cache hopperCompare[0]
# slot 3
execute unless entity @s[tag=gm4_dripleaf_filters_match] if data storage gm4_dripleaf_filters:cache {hopperCompare:[]} run tag @s add gm4_dripleaf_hopper_checked
execute unless entity @s[tag=gm4_dripleaf_filters_match] unless entity @s[tag=gm4_dripleaf_hopper_checked] store success storage gm4_dripleaf_filters:cache itemsAreDifferent byte 1 run data modify storage gm4_dripleaf_filters:cache hopperCompare[0].id set from storage gm4_dripleaf_filters:cache itemCompare
execute unless entity @s[tag=gm4_dripleaf_filters_match] unless entity @s[tag=gm4_dripleaf_hopper_checked] if data storage gm4_dripleaf_filters:cache {itemsAreDifferent:0b} run tag @s add gm4_dripleaf_filters_match
execute unless entity @s[tag=gm4_dripleaf_filters_match] unless entity @s[tag=gm4_dripleaf_hopper_checked] run data remove storage gm4_dripleaf_filters:cache hopperCompare[0]
# slot 4
execute unless entity @s[tag=gm4_dripleaf_filters_match] if data storage gm4_dripleaf_filters:cache {hopperCompare:[]} run tag @s add gm4_dripleaf_hopper_checked
execute unless entity @s[tag=gm4_dripleaf_filters_match] unless entity @s[tag=gm4_dripleaf_hopper_checked] store success storage gm4_dripleaf_filters:cache itemsAreDifferent byte 1 run data modify storage gm4_dripleaf_filters:cache hopperCompare[0].id set from storage gm4_dripleaf_filters:cache itemCompare
execute unless entity @s[tag=gm4_dripleaf_filters_match] unless entity @s[tag=gm4_dripleaf_hopper_checked] if data storage gm4_dripleaf_filters:cache {itemsAreDifferent:0b} run tag @s add gm4_dripleaf_filters_match
execute unless entity @s[tag=gm4_dripleaf_filters_match] unless entity @s[tag=gm4_dripleaf_hopper_checked] run data remove storage gm4_dripleaf_filters:cache hopperCompare[0]

execute if entity @s[tag=gm4_dripleaf_filters_match] run function gm4_dripleaf_filters:deposit_item