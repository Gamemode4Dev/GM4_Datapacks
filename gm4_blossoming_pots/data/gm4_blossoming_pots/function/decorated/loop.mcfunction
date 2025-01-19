# Main Loop 
# @s = temp marker inside decorated pot
# at @s align xyz positioned ~.5 ~.5 ~.5
# with {rotation, score, id, count, data}
# run from decorated/as_marker and self

# summon if needed
$execute unless entity @n[type=minecraft:block_display,distance=..0.1,tag=gm4_blossoming_pots.display.decorated_pot.$(score)] \
    run summon minecraft:block_display ~ ~ ~ {view_range:0.7935f,Tags:["gm4_blossoming_pots.display.decorated_pot","gm4_blossoming_pots.display.decorated_pot.$(score)","smithed.entity"],Rotation:[$(rotation)f,0f]}
# merge data and store the success
$execute store success score @s gm4_blossoming_pots.merge_success \
    run data merge entity @n[type=minecraft:block_display,distance=..0.1,tag=gm4_blossoming_pots.display.decorated_pot.$(score)] $(data)
# if a single merge success set sound to play
execute if score @s gm4_blossoming_pots.merge_success matches 1 run scoreboard players set @s gm4_blossoming_pots.sound 1

# set FallDistance to the current stage of the display, this is used to prevent running the loop when the displays already have the desired data
$data merge entity @n[type=minecraft:block_display,distance=..0.1,tag=gm4_blossoming_pots.display.decorated_pot.$(score)] {FallDistance:$(count).0f}

# increment score
execute store result storage gm4_blossoming_pots:decorated_pots temp.score int 1 run scoreboard players add @s gm4_blossoming_pots.loop 1

# sets temp.data to next score's data
function gm4_blossoming_pots:decorated/set_temp_data with storage gm4_blossoming_pots:decorated_pots temp
# run again if needed
execute unless score @s gm4_blossoming_pots.loop >= $array_len gm4_blossoming_pots.loop run function gm4_blossoming_pots:decorated/loop with storage gm4_blossoming_pots:decorated_pots temp
