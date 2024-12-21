
# add new entry to dps_array
data modify storage gm4_augmented_armor:temp dps.new set value {gametime:0,damage:0}
execute store result storage gm4_augmented_armor:temp dps.new.gametime int 1 run scoreboard players get $gametime gm4_aa_data
execute store result storage gm4_augmented_armor:temp dps.new.damage int 1 run scoreboard players get $damage_dealt gm4_aa_data
data modify storage gm4_augmented_armor:temp dps.array append from storage gm4_augmented_armor:temp dps.new

# update recent hit
execute on passengers if entity @s[tag=gm4_aa_training_dummy.recent_hit] run function gm4_augmented_armor:training_dummy/update/recent_hit

# update total damage (resets after 10 seconds of not taking damage)
execute unless score @s gm4_aa_training_dummy.timer matches 1.. run scoreboard players set @s gm4_aa_training_dummy.total_damage 0
scoreboard players set @s gm4_aa_training_dummy.timer 100
scoreboard players operation @s gm4_aa_training_dummy.total_damage += $damage_dealt gm4_aa_data
scoreboard players operation $total_damage gm4_aa_data = @s gm4_aa_training_dummy.total_damage
execute on passengers if entity @s[tag=gm4_aa_training_dummy.total_damage] run function gm4_augmented_armor:training_dummy/update/total_damage
