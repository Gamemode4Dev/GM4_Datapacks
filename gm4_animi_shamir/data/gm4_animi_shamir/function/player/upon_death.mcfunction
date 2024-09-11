# @s = player who has died
# at @s
# run from #gm4_player_death:soul_bound

# compile item list
data remove storage gm4_animi_shamir:cache prepared_entry
execute positioned ~ ~0.66 ~ as @e[type=item,distance=..0.67] if items entity @s contents *[custom_data~{gm4_metallurgy:{active_shamir:'animi'}}] if entity @s[nbt={Age:0s}] run function gm4_animi_shamir:item_caching/prepare_entry

# add entry to chache if any animi items were found
execute if data storage gm4_animi_shamir:cache prepared_entry.inventory run function gm4_animi_shamir:item_caching/add_entry
