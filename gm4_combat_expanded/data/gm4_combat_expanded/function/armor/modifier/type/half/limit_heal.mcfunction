# limit healing to half of max health
# @s = player to heal
# at unspecified
# run from any armor/active/heal/activate

scoreboard players operation $heal_to_remove gm4_ce_data = @s gm4_ce_health.current
scoreboard players operation $heal_to_remove gm4_ce_data += @s gm4_ce_healstore
scoreboard players operation $heal_to_remove gm4_ce_data -= @s gm4_ce_health.max_half
execute if score $heal_to_remove gm4_ce_data matches 1.. run scoreboard players operation @s gm4_ce_healstore -= $heal_to_remove gm4_ce_data
