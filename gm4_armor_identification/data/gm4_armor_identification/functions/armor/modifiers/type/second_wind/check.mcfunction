# run from armor/check_modifier
# @s = player wearing second_wind piece

# get cooldown of piece
execute store result score $cooldown gm4_ai_data run data get storage gm4_armor_identification:temp tag.gm4_armor_identification.cooldown

# check health if cooldown is ready
execute if score $cooldown gm4_ai_data matches 0 run function gm4_armor_identification:armor/modifiers/type/second_wind/heal_check

# reduce cooldown if needed
execute if score $cooldown gm4_ai_data matches 1.. store success score $change gm4_ai_data store result storage gm4_armor_identification:temp tag.gm4_armor_identification.cooldown int 1 run scoreboard players remove $cooldown gm4_ai_data 1
