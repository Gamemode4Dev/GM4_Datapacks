# loads the NBT of @s into storage and starts the update process if necessary.
# items verified as having the most recent NBT version are marked using the tag "gm4_ml_has_latest_nbt" AFTER being checked by this function.
# @s = band item to be checked for recent NBT
# run from smooshing/add_band/check and casting/sustain_mould

# load nbt into storage
data modify storage gm4_metallurgy:temp/item/band gm4_metallurgy set from entity @s[tag=!gm4_ml_has_latest_nbt] Item.tag.gm4_metallurgy

# update NBT if outdated tag was found
execute if data storage gm4_metallurgy:temp/item/band gm4_metallurgy.ore_type run function gm4_metallurgy:update_nbt_version/update_band

# mark items with recent NBT using a tag for increased performance when clocked
tag @s add gm4_ml_has_latest_nbt

# clear storage
data remove storage gm4_metallurgy:temp/item/band gm4_metallurgy
