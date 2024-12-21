
# convert to scores with decimals
scoreboard players operation $recent_hit.1 gm4_aa_data = $damage_dealt gm4_aa_data
scoreboard players operation $recent_hit.1 gm4_aa_data %= #10 gm4_aa_data
scoreboard players operation $recent_hit.10 gm4_aa_data = $damage_dealt gm4_aa_data
scoreboard players operation $recent_hit.10 gm4_aa_data /= #10 gm4_aa_data

# update display
data modify entity @s text set value '[{"translate":"entity.gm4.augmented_armor.training_dummy.recent_hit","fallback":"Last Hit: ","color":"gray"},{"score":{"name":"$recent_hit.10","objective":"gm4_aa_data"},"color":"white"},{"text":".","color":"white"},{"score":{"name":"$recent_hit.1","objective":"gm4_aa_data"},"color":"white"}]'
