# @s = armor/tool with the band
# run from smooshing/remove_band/check

execute if score custom_model_data gm4_ml_data matches 0 run data remove entity @s Item.components."minecraft:custom_model_data"
# Line 8 only clears custom data, while max stack size is its own component
execute if items entity @s contents *[custom_data~{gm4_metallurgy:{active_shamir:"infinitas"}}] run data remove entity @s Item.components."minecraft:max_stack_size"
data remove entity @s Item.components."minecraft:custom_data".gm4_metallurgy
execute if items entity @s contents *[custom_data={}] run data remove entity @s Item.components."minecraft:custom_data"

# use lib_lore to remove the correct lines of lore
data modify storage gm4_lore:temp Source set from entity @s Item.components."minecraft:lore"
# check legacy Metallurgy lore
data modify storage gm4_lore:temp Target set value '{"color":"aqua","fallback":"Shamir","italic":false,"translate":"item.gm4.metallurgy.shamir"}'

scoreboard players set $start gm4_lore 0
function #gm4_lore:search
execute unless score $index gm4_lore matches -1 run return run function gm4_metallurgy:smooshing/remove_band/clear_legacy_lore

# use lib_lore to remove the correct lines of lore
data modify storage gm4_lore:temp Target set from entity @s Item.components."minecraft:lore"[0]
scoreboard players set $start gm4_lore 0
scoreboard players set $extra gm4_lore 1
function #gm4_lore:remove
data modify entity @s Item.components."minecraft:lore" set from storage gm4_lore:temp Source

## Metallurgy lore 1.21+
# Name: Obsidian Cast
# Lore: <Metal Type> Band
#       <Shamir> Shamir

## Old Metallurgy lore (pre 1.21)
# Name: Obsidian Cast
# Lore: <Metal Type> Band
#       Shamir
#       <Shamir>
