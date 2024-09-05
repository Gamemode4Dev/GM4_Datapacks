# @s = mould requesting a band
# run from any function in casting/summon_band

tag @e[type=item,distance=..0.1,predicate=gm4_metallurgy:has_shamir,nbt={Age:0s}] add gm4_ml_band

# kill the band that matches the recasted band
execute store success score $has_recasted_band gm4_ml_data run data modify storage gm4_metallurgy:temp/item/cast stored_shamir set from entity @s ArmorItems[0].components."minecraft:custom_data".gm4_metallurgy.stored_shamir
execute if score $has_recasted_band gm4_ml_data matches 1 as @e[type=item,tag=gm4_ml_band] run function gm4_metallurgy:casting/prevent_duplicate_recast
data remove storage gm4_metallurgy:temp/item/cast recasted_shamir
data remove storage gm4_metallurgy:temp/item/cast stored_shamir

#select a random item and kill others
tag @e[type=item,tag=gm4_ml_band,sort=random,limit=1] add gm4_ml_selected_band
kill @e[type=item,tag=!gm4_ml_selected_band,tag=gm4_ml_band]

scoreboard players set $band_applied gm4_ml_data 1
