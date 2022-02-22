# run from armor/check_modifier
# @s = player to get shield

# add level of absorption to player total for armor piece
execute store result score $level gm4_ai_data run data get storage gm4_armor_identification:temp tag.gm4_armor_identification.level
scoreboard players operation @s gm4_ai_absorp += $level gm4_ai_data
