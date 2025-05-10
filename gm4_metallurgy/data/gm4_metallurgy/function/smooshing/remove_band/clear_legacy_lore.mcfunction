# @s = armor/tool with the band
# run from smooshing/remove_band/clear_data

# use lib_lore to remove the correct lines of lore
## NOTE: gm4_lore:temp Target is still "Shamir" from clear_data search
scoreboard players set $start gm4_lore -1
scoreboard players set $extra gm4_lore 2
function #gm4_lore:remove
data modify entity @s Item.components."minecraft:lore" set from storage gm4_lore:temp Source
