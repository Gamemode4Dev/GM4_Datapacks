# run from armor/active/canine/check
# @s = new wolf

tag @s remove gm4_ai_new_wolf
scoreboard players operation @s gm4_ai_id = $curr_id gm4_ai_id
scoreboard players operation @s gm4_ai_data = $slot gm4_ai_data
data modify entity @s Owner set from storage gm4_armor_identification:temp uuid
