# get scores to restore villager
# @s = furniture main interaction entity
# at @s
# runs from lightning/revive_villager

scoreboard players operation $restore_id gm4_furniture_id = @s gm4_furniture_id
scoreboard players operation $restore_index gm4_furniture_data = @s gm4_furniture_index
