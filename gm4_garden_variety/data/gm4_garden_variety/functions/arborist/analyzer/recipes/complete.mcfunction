# @s = gm4_gv_analyzer that has been broken
# run from gm4_garden_variety:custom_crafters/check_items

# visuals
playsound minecraft:entity.villager.work_librarian block @a[distance=..20]
advancement grant @a[distance=..10] only gm4:use_analyzer
data modify block ~ ~ ~ CookTime set value 0s

# reset scorboards and tags
scoreboard players set @s gm4_gv_analyze_p 0
tag @s remove gm4_gv_analyzing
