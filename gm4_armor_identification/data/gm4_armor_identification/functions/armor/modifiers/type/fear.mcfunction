# run from armor/check_modifier
# @s = mob to fear
# at @s

# get level of fear
execute store result score $level gm4_ai_data run data get storage gm4_armor_identification:temp tag.gm4_armor_identification.level

# freeze mobs for 1-2 seconds
execute if score $level gm4_ai_data matches 1 run effect give @s slowness 1 10
execute if score $level gm4_ai_data matches 2 run effect give @s slowness 2 10
execute if score $level gm4_ai_data matches 3 run effect give @s slowness 1 10
execute if score $level gm4_ai_data matches 4 run effect give @s slowness 2 10

# damage mobs at higher levels
execute if score $level gm4_ai_data matches 3 run effect give @s wither 1 4 true
execute if score $level gm4_ai_data matches 4 run effect give @s wither 2 4 true

# extra effects
effect give @s weakness 1 10 true
execute if score $level gm4_ai_data matches 1..2 anchored eyes run particle block blue_ice ^ ^ ^ 0.3 0.3 0.3 0 3
execute if score $level gm4_ai_data matches 3..4 anchored eyes run particle block blue_ice ^ ^ ^ 0.3 0.3 0.3 0.1 8
