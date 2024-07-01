# check furnace and store cooktime
# @s = smeltery marker
# run from furnace_lit

scoreboard players set $cook_time gm4_smelt_data -1
execute store result score $cook_time gm4_smelt_data run data get block ~ ~ ~ CookTime

# display ore
tag @s add gm4_smeltery_processing
scoreboard players operation $current gm4_smelt_id = @s gm4_smelt_id
execute if score $cook_time gm4_smelt_data matches 0.. positioned ^ ^-1.5 ^-1 as @e[type=armor_stand,tag=gm4_smeltery_cauldron,distance=..0.01] if score @s gm4_smelt_id = $current gm4_smelt_id positioned ^ ^1.5 ^1 run function gm4_smelteries:smelt/smelting
tag @s remove gm4_smeltery_processing
