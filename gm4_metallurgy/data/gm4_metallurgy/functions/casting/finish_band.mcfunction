# @s = mould requesting a band
# run from any function in casting/summon_band

# tag available shamirs
tag @e[type=item,distance=..0.1,nbt={Age:0s,Item:{tag:{gm4_metallurgy:{has_shamir:1b}}}}] add gm4_ml_band

# check whether some available shamirs must be excluded due to a recast
execute store success score $has_recasted_band gm4_ml_data run data modify storage gm4_metallurgy:temp/item/cast previous set from entity @s ArmorItems[0].tag.gm4_metallurgy
# | recast detected, reduce the amount of available shamirs
execute if score $has_recasted_band gm4_ml_data matches 1 run function gm4_metallurgy:casting/prevent_duplicate/prepare_memory
# | no recast detected (ore-only cast), skip recast logic
execute unless score $has_recasted_band gm4_ml_data matches 1 run function gm4_metallurgy:casting/select_shamir
