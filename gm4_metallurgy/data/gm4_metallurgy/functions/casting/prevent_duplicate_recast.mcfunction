# @s = new obsidian cast that was created by a recasted band
# run from any function in casting/finish_band

data modify storage gm4_metallurgy:temp/item/cast recasted_shamir set from storage gm4_metallurgy:temp/item/cast stored_shamir
execute store result score $different_shamir gm4_ml_data run data modify storage gm4_metallurgy:temp/item/cast recasted_shamir set from entity @s Item.tag.gm4_metallurgy.stored_shamir

execute unless score $different_shamir gm4_ml_data matches 1 run kill @s
