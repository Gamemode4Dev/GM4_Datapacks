# check furnace and store cooktime
# @s = smeltery marker
# at @s
# run from furnace_lit

scoreboard players set $cook_time gm4_smelt_data -1
execute store result score $cook_time gm4_smelt_data run data get block ~ ~ ~ cooking_time_spent

# display ore
tag @s add gm4_smeltery_processing
scoreboard players operation $current gm4_smelt_id = @s gm4_smelt_id
execute if score $cook_time gm4_smelt_data matches 0.. as @e[type=item_display,tag=gm4_smeltery_cauldron,distance=..0.01] if score @s gm4_smelt_id = $current gm4_smelt_id run function gm4_smelteries:smelt/smelting
tag @s remove gm4_smeltery_processing
