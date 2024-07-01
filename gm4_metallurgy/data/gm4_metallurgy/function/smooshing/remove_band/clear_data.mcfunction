# @s = armor/tool with the band
# run from smooshing/remove_band/check

execute if score custom_model_data gm4_ml_data matches 0 run data remove entity @s Item.components."minecraft:custom_model_data"
data remove entity @s Item.components."minecraft:custom_data".gm4_metallurgy

# use lib_lore to remove the correct lines of lore
data modify storage gm4_lore:temp Source set from entity @s Item.components."minecraft:lore"
## NOTE: gm4_lore:temp Target is still "Shamir" from finish_item
scoreboard players set $start gm4_lore -1
scoreboard players set $extra gm4_lore 2
function #gm4_lore:remove
data modify entity @s Item.components."minecraft:lore" set from storage gm4_lore:temp Source
