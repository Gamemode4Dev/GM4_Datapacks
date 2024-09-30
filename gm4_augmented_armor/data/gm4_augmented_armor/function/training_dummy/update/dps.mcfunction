
# calculate the actual damage per second
execute store result score $oldest_hit_time gm4_aa_data run data get storage gm4_augmented_armor:temp dps.array[0].gametime
scoreboard players operation $dps_duration gm4_aa_data = $gametime gm4_aa_data
scoreboard players operation $dps_duration gm4_aa_data -= $oldest_hit_time gm4_aa_data
scoreboard players operation $dps_duration gm4_aa_data /= #2 gm4_aa_data
scoreboard players operation $dps_duration gm4_aa_data > #10 gm4_aa_data
scoreboard players operation $dps gm4_aa_data *= #10 gm4_aa_data
scoreboard players operation $dps gm4_aa_data /= $dps_duration gm4_aa_data

# convert to scores with decimals
scoreboard players operation $dps.1 gm4_aa_data = $dps gm4_aa_data
scoreboard players operation $dps.1 gm4_aa_data %= #10 gm4_aa_data
scoreboard players operation $dps.10 gm4_aa_data = $dps gm4_aa_data
scoreboard players operation $dps.10 gm4_aa_data /= #10 gm4_aa_data

# update display
data modify entity @s text set value '[{"translate":"entity.gm4.augmented_armor.training_dummy.dps","fallback":"Damage / Second: ","color":"gray"},{"score":{"name":"$dps.10","objective":"gm4_aa_data"},"color":"white"},{"text":".","color":"white"},{"score":{"name":"$dps.1","objective":"gm4_aa_data"},"color":"white"}]'
