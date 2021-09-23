# @s = player who has died
# at @s
# run from gm4_animi_shamir:death advancement

# compile item list
data remove storage gm4_animi_shamir:cache prepared_entry
execute positioned ~ ~1.6 ~ as @e[type=item,distance=..0.5,nbt={Age:0s,Item:{tag:{gm4_metallurgy:{active_shamir:'animi'}}}}] run function gm4_animi_shamir:item_caching/prepare_entry

# add entry to chache if any animi items were found
execute if data storage gm4_animi_shamir:cache prepared_entry.inventory run function gm4_animi_shamir:item_caching/add_entry
