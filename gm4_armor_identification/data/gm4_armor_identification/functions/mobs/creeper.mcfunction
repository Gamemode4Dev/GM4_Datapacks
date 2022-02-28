# run from mobs/initiate
# @s = creeper
# at @s

# calculate stats based on difficulty
scoreboard players operation $mob_speed gm4_ai_data += $difficulty gm4_ai_data
execute if score $difficulty gm4_ai_data matches 4.. run scoreboard players operation $mob_health gm4_ai_data += $difficulty gm4_ai_data
execute if score $difficulty gm4_ai_data matches 4.. run scoreboard players remove $mob_health gm4_ai_data 3
execute if score $difficulty gm4_ai_data matches 11.. run scoreboard players add $mob_armor gm4_ai_data 4

# biome specific modifiers for this mob
execute if predicate gm4_armor_identification:mobs/modifiers/burned run data modify entity @s Fuse set value 22
execute if predicate gm4_armor_identification:mobs/modifiers/flowering run tag @s add gm4_ai_cloaking_creeper
execute if predicate gm4_armor_identification:mobs/modifiers/toxic run effect give @s blindness 1000000 0 true
execute if predicate gm4_armor_identification:mobs/modifiers/toxic run effect give @s weakness 1000000 1
execute if predicate gm4_armor_identification:mobs/modifiers/toxic run effect give @s nausea 1000000 0 true

# set modifiers
function gm4_armor_identification:mobs/modifiers/prep
