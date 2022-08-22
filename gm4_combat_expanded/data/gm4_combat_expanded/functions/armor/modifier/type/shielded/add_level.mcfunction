# add level of absorption to player total depending on armor piece level, absorption will be granted at end of player processing (this tick)
# @s = player to get shield
# at world spawn
# run from armor/check_modifier/safe

execute store result score $level gm4_ce_data run data get storage gm4_combat_expanded:temp tag.gm4_combat_expanded.level
scoreboard players operation @s gm4_ce_absorp += $level gm4_ce_data
