# updates the auto crafter recipe shape
# @s = auto crafter that's updating it's recipe shape
# located at @s
# run from gm4_auto_crafting:auto_crafter/caching/temp_clock

# move block data to temp storage
data modify storage gm4_auto_crafting:temp cache set from block ~ ~ ~ Items

# store slot count
execute store result score @s gm4_ac_slot_count run data get storage gm4_auto_crafting:temp cache
scoreboard players add @s gm4_ac_buffer 0

# store recipe shape as a sum of binary numbers
scoreboard players set @s gm4_ac_shape 0
execute if data storage gm4_auto_crafting:temp cache[{Slot:0b}] run scoreboard players add @s gm4_ac_shape 256
execute if data storage gm4_auto_crafting:temp cache[{Slot:1b}] run scoreboard players add @s gm4_ac_shape 128
execute if data storage gm4_auto_crafting:temp cache[{Slot:2b}] run scoreboard players add @s gm4_ac_shape 64
execute if data storage gm4_auto_crafting:temp cache[{Slot:3b}] run scoreboard players add @s gm4_ac_shape 32
execute if data storage gm4_auto_crafting:temp cache[{Slot:4b}] run scoreboard players add @s gm4_ac_shape 16
execute if data storage gm4_auto_crafting:temp cache[{Slot:5b}] run scoreboard players add @s gm4_ac_shape 8
execute if data storage gm4_auto_crafting:temp cache[{Slot:6b}] run scoreboard players add @s gm4_ac_shape 4
execute if data storage gm4_auto_crafting:temp cache[{Slot:7b}] run scoreboard players add @s gm4_ac_shape 2
execute if data storage gm4_auto_crafting:temp cache[{Slot:8b}] run scoreboard players add @s gm4_ac_shape 1

# clean up
data remove storage gm4_auto_crafting:temp cache

# mark as finished updating if there's no nearby players
execute unless entity @a[distance=..6,limit=1] run tag @s remove gm4_ac_updating
