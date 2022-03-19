# run from armor/check_modifier
# @s = player to get shield

# add level of absorption to player total for armor piece
execute store result score $level gm4_ce_data run data get storage gm4_combat_evolved:temp tag.gm4_combat_evolved.level
scoreboard players operation @s gm4_ce_absorp += $level gm4_ce_data
