# removes the muation lore
# @s = @e[type=item,distance=..1,limit=1,sort=nearest,nbt={Age:0s}]
# at @s
# run from gm4_garden_variety:utility/mutations/lore/apply
# run from gm4_garden_variety:mechanics/analyzer/recipes/remove_name_tag/complete


# copy storage
data modify storage gm4_garden_variety:modify/item output set from storage gm4_garden_variety:modify/item input

# remove lore
data remove storage gm4_lore:temp Source
data modify storage gm4_lore:temp Source set from storage gm4_garden_variety:modify/item output.tag.display.Lore
data modify storage gm4_lore:temp Target set value '[{"text":"Sapling Mutations","color":"#BD6FFD","italic":false}]'
execute store result score $extra gm4_lore run data get storage gm4_garden_variety:modify/item output.tag.gm4_garden_variety.lore.extra_lore
function #gm4_lore:remove
data modify storage gm4_garden_variety:modify/item output.tag.display.Lore set from storage gm4_lore:temp Source

# remove gv lore nbt
data remove storage gm4_garden_variety:modify/item output.tag.gm4_garden_variety.lore
