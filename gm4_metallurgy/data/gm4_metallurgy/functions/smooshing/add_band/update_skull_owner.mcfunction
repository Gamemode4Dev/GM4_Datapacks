# @s = item to receive the shamir
# called from smooshing/add_band/found_item

# Prepare storage in format expected by #gm4_metallurgy:update_skull_owner
data modify storage gm4_metallurgy:temp/shamir name set from entity @s Item.tag.gm4_metallurgy.active_shamir
data remove storage gm4_metallurgy:temp/shamir skull_owner

# Populate the skull_owner tag based on shamir name.
function #gm4_metallurgy:update_skull_owner

# Store the skull_owner tag within the smooshed item.
data modify entity @s Item.tag.gm4_metallurgy.skull_owner set from storage gm4_metallurgy:temp/shamir skull_owner
