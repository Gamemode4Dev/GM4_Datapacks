# @s = player who reeled in the armor stand w/ fishing rod in offhand
# run from reel_in/reel_rod and reel_in/reel_loot

execute store result score @s gm4_ef_data run data get entity @s Inventory[{Slot:-106b}].tag.Damage
tag @s add gm4_ef_durability_off
schedule function gm4_end_fishing:durability/check 1t
