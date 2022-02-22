# run from armor/modifiers/type/witch/check
# @s = player wearing witch armour

# mark for change
scoreboard players set $change gm4_ai_data 1

# reduce cooldown by 1 and check for it ending
execute store result storage gm4_armor_identification:temp tag.gm4_armor_identification.cooldown int 1 run scoreboard players remove $cooldown gm4_ai_data 1
execute if score $cooldown gm4_ai_data matches 0 run function gm4_armor_identification:armor/modifiers/type/witch/recharge
