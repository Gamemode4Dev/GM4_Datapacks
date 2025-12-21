# Main Loop for setting displays to desired stage
# @s = temp entity inside decorated pot
# at @s align xyz positioned ~.5 ~.5 ~.5
# with {display_number, count, data}
# run from decorated/prepare_data and self

# create display
$summon minecraft:block_display ~ ~ ~ $(data)
# set display_stage score to prevent running the loop when the displays are already on the right stage number
$scoreboard players set @e[type=minecraft:block_display,distance=..0.1,tag=gm4_blossoming_pots.display.decorated_pot.$(display_number),limit=1] gm4_blossoming_pots.display_stage $(count)

# increment display_number
execute store result storage gm4_blossoming_pots:decorated_pots temp.display_number int 1 run scoreboard players add $display_number gm4_blossoming_pots.misc 1

# sets temp.data to next display_number's data
function gm4_blossoming_pots:decorated/set_temp_data with storage gm4_blossoming_pots:decorated_pots temp
# run again if needed
execute unless score $display_number gm4_blossoming_pots.misc >= $array_len gm4_blossoming_pots.misc run function gm4_blossoming_pots:decorated/set_displays with storage gm4_blossoming_pots:decorated_pots temp
