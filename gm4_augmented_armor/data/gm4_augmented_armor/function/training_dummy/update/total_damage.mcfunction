
# convert to scores with decimals
scoreboard players operation $total_damage.1 gm4_aa_data = $total_damage gm4_aa_data
scoreboard players operation $total_damage.1 gm4_aa_data %= #10 gm4_aa_data
scoreboard players operation $total_damage.10 gm4_aa_data = $total_damage gm4_aa_data
scoreboard players operation $total_damage.10 gm4_aa_data /= #10 gm4_aa_data

# update display
data modify entity @s text set value '[{"translate":"entity.gm4.augmented_armor.training_dummy.total_damage","fallback":"Total Damage: ","color":"gray"},{"score":{"name":"$total_damage.10","objective":"gm4_aa_data"},"color":"white"},{"text":".","color":"white"},{"score":{"name":"$total_damage.1","objective":"gm4_aa_data"},"color":"white"}]'
