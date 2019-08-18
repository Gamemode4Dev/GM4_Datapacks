#unless the module is already initialized
execute unless score crossbow_cables gm4_modules matches 1.. run function crossbow_cables:init
scoreboard players add installed_modules gm4_up_check 1

#string storing scoreboard
scoreboard objectives add gm4_string_count dummy
scoreboard objectives add gm4_rot_x dummy
scoreboard objectives add gm4_rot_y dummy