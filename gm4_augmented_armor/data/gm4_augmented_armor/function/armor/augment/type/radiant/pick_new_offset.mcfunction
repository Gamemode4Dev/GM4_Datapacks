# pick a new offset for the radiant display
# @s = radiant block_display
# at linked player
# run from armor/augment/type/radiant/process

# if glowing emit a flash as well
execute if entity @s[tag=gm4_aa_radiant.glowing] at @s run particle flash ~ ~ ~ 0 0 0 1 1 normal @a

execute store result score $offset_x gm4_aa_data run random value -50..0
execute store result score $offset_y gm4_aa_data run random value -50..-25
execute store result score $offset_z gm4_aa_data run random value -50..0
execute store result storage gm4_augmented_armor:temp radiant_data.offset_x float 0.00001 run scoreboard players operation $offset_x gm4_aa_data *= #1000 gm4_aa_data
execute store result storage gm4_augmented_armor:temp radiant_data.offset_y float 0.00001 run scoreboard players operation $offset_y gm4_aa_data *= #1000 gm4_aa_data
execute store result storage gm4_augmented_armor:temp radiant_data.offset_z float 0.00001 run scoreboard players operation $offset_z gm4_aa_data *= #1000 gm4_aa_data
scoreboard players set $passenger_offset_x gm4_aa_data 3125
scoreboard players set $passenger_offset_y gm4_aa_data 3125
scoreboard players set $passenger_offset_z gm4_aa_data 3125
execute store result storage gm4_augmented_armor:temp radiant_data.passenger_offset_x float 0.00001 run scoreboard players operation $passenger_offset_x gm4_aa_data += $offset_x gm4_aa_data
execute store result storage gm4_augmented_armor:temp radiant_data.passenger_offset_y float 0.00001 run scoreboard players operation $passenger_offset_y gm4_aa_data += $offset_y gm4_aa_data
execute store result storage gm4_augmented_armor:temp radiant_data.passenger_offset_z float 0.00001 run scoreboard players operation $passenger_offset_z gm4_aa_data += $offset_z gm4_aa_data
function gm4_augmented_armor:armor/augment/type/radiant/eval_offset with storage gm4_augmented_armor:temp radiant_data
data remove storage gm4_augmented_armor:temp radiant_data
