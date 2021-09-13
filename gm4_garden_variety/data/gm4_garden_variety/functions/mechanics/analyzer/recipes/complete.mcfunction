# completes the recipe
# @s = @s[tag=gm4_gv_analyzer]
# at @s
# run from gm4_garden_variety:mechanics/analyzer/recipes/RECIPE/complete


# visuals
playsound minecraft:entity.villager.work_librarian block @a[distance=..20]
data modify block ~ ~ ~ CookTime set value 0s

# reset scorboards and tags
scoreboard players set @s gm4_gv_analyze_p 0
tag @s remove gm4_gv_analyzing

# advancements
execute if score $mutations gm4_gv_nbt_data matches 1.. run advancement grant @a[distance=..5] only gm4:discover_mutation
execute if score $mutations gm4_gv_nbt_data matches 5.. run advancement grant @a[distance=..5] only gm4:discover_mutation_5
execute if score $mutations gm4_gv_nbt_data matches 14.. run advancement grant @a[distance=..5] only gm4:discover_mutation_all
