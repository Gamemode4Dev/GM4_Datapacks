# searches for an entry with owner = prepared_entry.owner. Stores the last match into prepared_entry.inventory. Deletes all duplicates.
# run from gm4_animi_shamir:player/respawn_inventory

# load target UUID into temp field
data modify storage gm4_animi_shamir:cache temp_entry.owner set from storage gm4_animi_shamir:cache prepared_entry.owner

# compare against UUID from list
execute store result score $success gm4_animi_deaths run data modify storage gm4_animi_shamir:cache temp_entry.owner set from storage gm4_animi_shamir:cache inventories[0].owner

# store entry into named field if a match is detected
execute if score $success gm4_animi_deaths matches 0 run data modify storage gm4_animi_shamir:cache prepared_entry.inventory set from storage gm4_animi_shamir:cache inventories[0].inventory

# cycle entries and delete entry if UUID matched
execute if score $success gm4_animi_deaths matches 1.. run data modify storage gm4_animi_shamir:cache inventories append from storage gm4_animi_shamir:cache inventories[0]
data remove storage gm4_animi_shamir:cache inventories[0]

# loop until all entries are checked
scoreboard players remove $loop gm4_animi_deaths 1
execute if score $loop gm4_animi_deaths matches 1.. run function gm4_animi_shamir:item_caching/search_entry
