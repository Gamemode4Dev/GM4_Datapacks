# @s = new band item
# run from smooshing/remove_band/found_obsidian

# use lib_lore to get the correct line of lore
## get the line after the line "Shamir" from the tool/armor piece
data modify storage gm4_lore:temp Source set from entity @e[type=item,tag=gm4_ml_source,dx=0,limit=1] Item.components."minecraft:lore"
data modify storage gm4_lore:temp Target set from entity @s Item.components."minecraft:lore"[1]
scoreboard players set $start gm4_lore 1
function #gm4_lore:remove
## add the Shamir name to the band lore
data modify entity @s Item.components."minecraft:lore" append from storage gm4_lore:temp Dump[]

data modify entity @s Item.components."minecraft:custom_data".gm4_metallurgy.stored_shamir set from entity @e[type=item,tag=gm4_ml_source,dx=0,limit=1] Item.components."minecraft:custom_data".gm4_metallurgy.active_shamir
data modify entity @s Item.components."minecraft:custom_model_data" set from entity @e[type=item,tag=gm4_ml_source,dx=0,limit=1] Item.components."minecraft:custom_data".gm4_metallurgy.custom_model_data

tag @s add gm4_ml_smooshed
