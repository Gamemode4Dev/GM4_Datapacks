# Run from main
# @s = All items with the tag "gm4_can_become_shiny"

# Prevent item from stacking with other items
execute run data modify entity @s Item.tag.unstackable set value 1b

# Prevent item from being picked up
execute run data modify entity @s PickupDelay set value 17s

# Condition for item to loose tag "gm4_can_become_shiny"
execute unless entity @e[type=minecraft:experience_orb,distance=..2] run data remove entity @s Item.tag.unstackable
execute unless entity @e[type=minecraft:experience_orb,distance=..2] run tag @s remove gm4_can_become_shiny

# Set score to 0 if it doesn't have a score
execute unless score @s gm4_absorbed_xp matches 0.. run scoreboard players set @s gm4_absorbed_xp 0

# Make Item "Shiny" if it has enough XP
execute as @e[tag=gm4_can_become_shiny] store result score @s gm4_xporb_xp run data get entity @s Value 1
execute if score @s gm4_absorbed_xp >= #xp_required gm4_shiny_ctrl run function gm4_shiny_items:make_item_shiny
