#@s = crafters containing a recipe results
#Run from recipe_validity_check

execute store result score stack_multiplier gm4_stack_size run data get block ~ ~ ~ Items[0].tag.gm4_custom_crafters.multiplier
scoreboard players operation @s gm4_stack_size *= stack_multiplier gm4_stack_size
execute store result block ~ ~ ~ Items[0].Count byte 1 run scoreboard players get @s gm4_stack_size
#data remove block
data remove block ~ ~ ~ Items[0].tag.gm4_custom_crafters
