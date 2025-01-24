
# total damage timer
scoreboard players remove @s[scores={gm4_aa_training_dummy.timer=1..}] gm4_aa_training_dummy.timer 1

# check if the dummy lost health
execute store result score $health gm4_aa_data run data get entity @s Health 10
execute if score $health gm4_aa_data matches 10000.. unless score @s gm4_aa_training_dummy.dps matches 1.. run return 0

# calculate the damage dealt (x10)
scoreboard players set $damage_dealt gm4_aa_data 10000
scoreboard players operation $damage_dealt gm4_aa_data -= $health gm4_aa_data

# grab the array of recent damages
data modify storage gm4_augmented_armor:temp dps.array set from entity @s ArmorItems[0].components."minecraft:custom_data".gm4_augmented_armor.dps_array
# check if the oldest entry is more than 10 seconds old, if so remove it and reduce total damage by it
execute store result score $keep_entry gm4_aa_data run data get storage gm4_augmented_armor:temp dps.array[0].gametime
scoreboard players add $keep_entry gm4_aa_data 100
execute store result score $gametime gm4_aa_data run time query gametime
scoreboard players operation $keep_entry gm4_aa_data -= $gametime gm4_aa_data
execute unless score $keep_entry gm4_aa_data matches 1.. run function gm4_augmented_armor:training_dummy/dps_remove

# update the damage displays if needed
execute if score $damage_dealt gm4_aa_data matches 1.. run function gm4_augmented_armor:training_dummy/damage_dealt

# update dps display
scoreboard players operation @s gm4_aa_training_dummy.dps += $damage_dealt gm4_aa_data
scoreboard players operation $dps gm4_aa_data = @s gm4_aa_training_dummy.dps
execute on passengers if entity @s[tag=gm4_aa_training_dummy.dps] run function gm4_augmented_armor:training_dummy/update/dps

# store the array of recent damages
data modify entity @s ArmorItems[0].components."minecraft:custom_data".gm4_augmented_armor.dps_array set from storage gm4_augmented_armor:temp dps.array

# cleanup
data remove storage gm4_augmented_armor:temp dps
data modify entity @s Health set value 1000
