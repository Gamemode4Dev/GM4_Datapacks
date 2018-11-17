#@s = alchemical crafters containing a recipe results
#Run from post_effects/check_charge

execute store result block ~ ~ ~ Items[0].Count byte 1 run scoreboard players get @s gm4_stack_size
execute store result score stack_multiplier gm4_stack_size run data get block ~ ~ ~ Items[1].tag.gm4_alchemical_crafters.multiplier
scoreboard players operation @s gm4_stack_size *= stack_multiplier gm4_stack_size
execute store result block ~ ~ ~ Items[1].Count byte 1 run scoreboard players get @s gm4_stack_size
#data remove block
data remove block ~ ~ ~ Items[1].tag.gm4_alchemical_crafters
data remove block ~ ~ ~ Items[0].tag.gm4_alchemical_crafters

execute store result score tag_size gm4_stack_size run data get block ~ ~ ~ Items[1].tag
execute if score tag_size gm4_stack_size matches 0 run data remove block ~ ~ ~ Items[1].tag
execute store result score tag_size gm4_stack_size run data get block ~ ~ ~ Items[0].tag
execute if score tag_size gm4_stack_size matches 0 run data remove block ~ ~ ~ Items[0].tag
