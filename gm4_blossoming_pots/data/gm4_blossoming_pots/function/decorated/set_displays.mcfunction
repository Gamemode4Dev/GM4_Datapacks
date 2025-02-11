# Main Loop for setting displays to desired stage
# @s = temp entity inside decorated pot
# at @s align xyz positioned ~.5 ~.5 ~.5
# with {rotation, score, id, count, data}
# run from decorated/prepare_data and self

# summon if needed
$execute unless entity @e[type=minecraft:block_display,distance=..0.1,tag=gm4_blossoming_pots.display.decorated_pot.$(score),limit=1] \
    run summon minecraft:block_display ~ ~ ~ {view_range:0.7935f,Tags:["gm4_blossoming_pots.display.decorated_pot","gm4_blossoming_pots.display.decorated_pot.$(score)","smithed.entity"],Rotation:[$(rotation)f,0f]}
# merge data and store the success
$execute store success score @s gm4_blossoming_pots.merge_success \
    run data merge entity @e[type=minecraft:block_display,distance=..0.1,tag=gm4_blossoming_pots.display.decorated_pot.$(score),limit=1] $(data)
# set display_stage score to prevent running the loop when the displays are already on the right stage number
$scoreboard players set @e[type=minecraft:block_display,distance=..0.1,tag=gm4_blossoming_pots.display.decorated_pot.$(score),limit=1] gm4_blossoming_pots.display_stage $(count)

# if a single merge success set sound to play
execute if score @s gm4_blossoming_pots.merge_success matches 1 run scoreboard players set @s gm4_blossoming_pots.sound 1

# increment score
execute store result storage gm4_blossoming_pots:decorated_pots temp.score int 1 run scoreboard players add @s gm4_blossoming_pots.loop 1

# sets temp.data to next score's data
function gm4_blossoming_pots:decorated/set_temp_data with storage gm4_blossoming_pots:decorated_pots temp
# run again if needed
execute unless score @s gm4_blossoming_pots.loop >= $array_len gm4_blossoming_pots.loop run function gm4_blossoming_pots:decorated/set_displays with storage gm4_blossoming_pots:decorated_pots temp
