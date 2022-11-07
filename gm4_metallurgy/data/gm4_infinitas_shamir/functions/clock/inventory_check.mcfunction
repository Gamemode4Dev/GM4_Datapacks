# Checks if the player has an empty or Infinitas Water Bucket in their inventory
# @s = player with tag, gm4_has_infinitas
# run from gm4_infinitas_shamir:clock/active

execute if entity @s[tag=gm4_has_empty_infinitas] run function gm4_infinitas_shamir:empty/check_inventory
execute if score $lava_infinitas gm4_ml_data matches 1 if entity @s[tag=gm4_has_lava_infinitas] run function gm4_infinitas_shamir:lava/check_inventory
execute if entity @s[tag=gm4_has_powder_snow_infinitas] run function gm4_infinitas_shamir:powder_snow/check_inventory
execute if entity @s[tag=gm4_has_water_infinitas] run function gm4_infinitas_shamir:water/check_inventory
