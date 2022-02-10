# @s = potential item to receive the shamir
# called from smooshing/add_band/check

function #gm4_metallurgy:check_item_validity

execute if score valid_item gm4_ml_data matches 1 run function gm4_metallurgy:smooshing/add_band/found_item
