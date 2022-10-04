# Prepares the list of memorized shamirs by adding the currenlty stored shamir to it. Starts the comparison process.
# @s = mould requesting a band
# at location of mold requesting a band
# run from gm4_metallurgy:casting/finish_band

# prepare storage with stored shamir of recast cast (memorized_shamirs never contains the current shamir on a obsidian cast)
data modify storage gm4_metallurgy:temp/item/cast previous.memorized_shamirs prepend from storage gm4_metallurgy:temp/item/cast previous.stored_shamir

# copy to new field to allow for search optimization via entry deletion
data modify storage gm4_metallurgy:temp/item/cast previous.excluded_shamirs set from storage gm4_metallurgy:temp/item/cast previous.memorized_shamirs

# remove shamirs that are included in the memorized shamirs from the shamir pool
execute as @e[type=item,tag=gm4_ml_band] run function gm4_metallurgy:casting/prevent_duplicate/init_comparison

# if there are any shamirs remaining, spawn the shamir, otherwise a mundane band is spawned as the flag $band_applied gm4_ml_data remains at 0
execute if entity @e[type=item,tag=gm4_ml_band,limit=1] run function gm4_metallurgy:casting/select_shamir
