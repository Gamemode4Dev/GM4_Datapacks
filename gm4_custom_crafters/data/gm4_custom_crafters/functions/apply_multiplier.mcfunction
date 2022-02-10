#@s = crafters containing a recipe results
#Run from recipe_validity_check

execute store result score stack_multiplier gm4_stack_size run data get storage gm4_custom_crafters:temp/crafter Items[0].tag.gm4_custom_crafters.multiplier
scoreboard players operation @s gm4_stack_size *= stack_multiplier gm4_stack_size
execute store result storage gm4_custom_crafters:temp/crafter Items[0].Count byte 1 run scoreboard players get @s gm4_stack_size
#data remove block
data remove storage gm4_custom_crafters:temp/crafter Items[0].tag.gm4_custom_crafters

#remove tag
execute store result score tag_size gm4_stack_size run data get storage gm4_custom_crafters:temp/crafter Items[0].tag
execute if score tag_size gm4_stack_size matches 0 run data remove storage gm4_custom_crafters:temp/crafter Items[0].tag
