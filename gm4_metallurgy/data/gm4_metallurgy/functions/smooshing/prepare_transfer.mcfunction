# @s = item being crushed by a piston that has a shamir
# run from tick

tag @s add gm4_ml_source
execute if data entity @s Item.tag.gm4_metallurgy.stored_shamir run function gm4_metallurgy:smooshing/add_band/check
execute if data entity @s Item.tag.gm4_metallurgy.active_shamir run function gm4_metallurgy:smooshing/remove_band/check
tag @s remove gm4_ml_source
