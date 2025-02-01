# Main Loop for setting displays to desired stage
# @s = temp marker inside flower pot
# at @s align xyz positioned ~.5 ~.5 ~.5
# with {rotation, score, data}
# run from flower/as_marker and self

# summon if needed
$execute unless entity @e[type=minecraft:block_display,distance=..0.1,tag=gm4_blossoming_pots.display.flower_pot.$(score),limit=1] \
    run summon minecraft:block_display ~ ~ ~ {view_range:0.7935f,Tags:["gm4_blossoming_pots.display.flower_pot","gm4_blossoming_pots.display.flower_pot.$(score)","smithed.entity"],Rotation:[$(rotation)f,0f]}
# merge data and store the success
$execute store success score @s gm4_blossoming_pots.merge_success \
    run data merge entity @e[type=minecraft:block_display,distance=..0.1,tag=gm4_blossoming_pots.display.flower_pot.$(score),limit=1] $(data)
# if a single merge success set sound to play
execute if score @s gm4_blossoming_pots.merge_success matches 1 run scoreboard players set @s gm4_blossoming_pots.sound 1

# increment score
execute store result storage gm4_blossoming_pots:flower_pots temp.score int 1 run scoreboard players add @s gm4_blossoming_pots.loop 1

# sets temp.data to next score's data
function gm4_blossoming_pots:flower/set_temp_data with storage gm4_blossoming_pots:flower_pots temp
# run again if needed
execute unless score @s gm4_blossoming_pots.loop >= $array_len gm4_blossoming_pots.loop run function gm4_blossoming_pots:flower/set_displays with storage gm4_blossoming_pots:flower_pots temp
