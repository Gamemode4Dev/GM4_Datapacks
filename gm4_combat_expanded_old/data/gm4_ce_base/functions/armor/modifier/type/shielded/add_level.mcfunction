# add level of absorption to player total depending on armor piece level, absorption will be granted at end of player processing (this tick)
# @s = player to get shield
# at unspecified
# run from armor/check_modifier/safety

execute store result score $level gm4_ce_data run data get storage gm4_combat_expanded:temp components."minecraft:custom_data".gm4_combat_expanded.level
scoreboard players operation @s gm4_ce_absorp += $level gm4_ce_data
