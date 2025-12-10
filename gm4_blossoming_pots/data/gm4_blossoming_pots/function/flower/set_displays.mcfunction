# Main Loop for setting displays to desired stage
# @s = temp entity inside flower pot
# at @s align xyz positioned ~.5 ~.5 ~.5
# with {data}
# run from flower/prepare_data and self

# create display
$summon minecraft:block_display ~ ~ ~ $(data)

# increment display_number
execute store result storage gm4_blossoming_pots:flower_pots temp.display_number int 1 run scoreboard players add $display_number gm4_blossoming_pots.misc 1

# sets temp.data to next display_number's data
function gm4_blossoming_pots:flower/set_temp_data with storage gm4_blossoming_pots:flower_pots temp
# run again if needed
execute unless score $display_number gm4_blossoming_pots.misc >= $array_len gm4_blossoming_pots.misc run function gm4_blossoming_pots:flower/set_displays with storage gm4_blossoming_pots:flower_pots temp
