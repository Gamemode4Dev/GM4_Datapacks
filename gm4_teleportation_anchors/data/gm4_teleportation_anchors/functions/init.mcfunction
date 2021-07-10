scoreboard objectives add gm4_ta_data dummy
scoreboard objectives add gm4_ta_id dummy
scoreboard objectives add gm4_ta_fuel dummy
scoreboard objectives add gm4_ta_jam_time dummy
scoreboard objectives add gm4_ta_cooldown dummy
scoreboard objectives add gm4_ta_ignore dummy
scoreboard objectives add gm4_ta_jam_id dummy
scoreboard objectives add gm4_ta_pos_x dummy
scoreboard objectives add gm4_ta_pos_y dummy
scoreboard objectives add gm4_ta_pos_z dummy

execute unless score gm4_teleportation_anchors gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Teleportation Anchors"}
scoreboard players set gm4_teleportation_anchors gm4_modules 1

schedule function gm4_teleportation_anchors:main 1t
schedule function gm4_teleportation_anchors:tick 1t

#$moduleUpdateList
