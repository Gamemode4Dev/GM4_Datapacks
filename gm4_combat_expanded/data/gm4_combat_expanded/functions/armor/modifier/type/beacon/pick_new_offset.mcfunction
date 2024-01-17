
execute store result score $offset_x gm4_ce_data run random value -50..0
execute store result score $offset_y gm4_ce_data run random value -50..-25
execute store result score $offset_z gm4_ce_data run random value -50..0
execute store result storage gm4_combat_expanded:temp beacon_data.offset_x float 0.00001 run scoreboard players operation $offset_x gm4_ce_data *= #1000 gm4_ce_data
execute store result storage gm4_combat_expanded:temp beacon_data.offset_y float 0.00001 run scoreboard players operation $offset_y gm4_ce_data *= #1000 gm4_ce_data
execute store result storage gm4_combat_expanded:temp beacon_data.offset_z float 0.00001 run scoreboard players operation $offset_z gm4_ce_data *= #1000 gm4_ce_data
scoreboard players set $passenger_offset_x gm4_ce_data 3125
scoreboard players set $passenger_offset_y gm4_ce_data 3125
scoreboard players set $passenger_offset_z gm4_ce_data 3125
execute store result storage gm4_combat_expanded:temp beacon_data.passenger_offset_x float 0.00001 run scoreboard players operation $passenger_offset_x gm4_ce_data += $offset_x gm4_ce_data
execute store result storage gm4_combat_expanded:temp beacon_data.passenger_offset_y float 0.00001 run scoreboard players operation $passenger_offset_y gm4_ce_data += $offset_y gm4_ce_data
execute store result storage gm4_combat_expanded:temp beacon_data.passenger_offset_z float 0.00001 run scoreboard players operation $passenger_offset_z gm4_ce_data += $offset_z gm4_ce_data
function gm4_combat_expanded:armor/modifier/type/beacon/eval_offset with storage gm4_combat_expanded:temp beacon_data
#data remove storage gm4_combat_expanded:temp beacon_data

