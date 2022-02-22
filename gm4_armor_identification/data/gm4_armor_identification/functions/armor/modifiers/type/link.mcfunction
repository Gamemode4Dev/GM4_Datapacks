# run from armor/check_modifier
# @s = player being checked
# at @s

# get level
execute store result score $level gm4_ai_data run data get storage gm4_armor_identification:temp tag.gm4_armor_identification.level

# give effect
execute if score $level gm4_ai_data matches 1..2 run effect give @a[distance=0.01..5] strength 1 0
execute if score $level gm4_ai_data matches 3 run effect give @a[distance=0.01..5] strength 1 1
