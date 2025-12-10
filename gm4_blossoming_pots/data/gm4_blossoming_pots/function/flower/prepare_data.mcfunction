# Sets up loop for plant stage changes
# @s = temp entity inside flower pot
# at @s align xyz positioned ~.5 ~.5 ~.5
# with {id, rotation}
# run from flower/raycast and upgrade_paths/3.1/legacy_flower_pot

# early returns
# if empty hand, empty the pot, give player the item
execute if data storage gm4_blossoming_pots:flower_pots {temp:{id:"null"}} run return run function gm4_blossoming_pots:flower/remove_plant
# if storage doesn't have, doesnt matter
$execute unless data storage gm4_blossoming_pots:flower_pots $(id) run return run kill @s
# if existing display, fail
execute if entity @e[type=minecraft:block_display,tag=gm4_blossoming_pots.display.flower_pot,distance=..0.1,limit=1] run return run kill @s
# fail if smithed.block
execute align xyz if entity @e[tag=smithed.block,dx=0,dz=0,dy=0,limit=1] run return run kill @s

# signal player mainhand to be decremented by as_player
scoreboard players set $signal_item_decr gm4_blossoming_pots.misc 1

# setting temp
execute store result storage gm4_blossoming_pots:flower_pots temp.display_number int 1 run scoreboard players set $display_number gm4_blossoming_pots.misc 0
function gm4_blossoming_pots:flower/set_temp_data with storage gm4_blossoming_pots:flower_pots temp
# temp storage should now contain {rotation, display_number, id, count, data}

# store the number of displays needed
$execute store result score $array_len gm4_blossoming_pots.misc run data get storage gm4_blossoming_pots:flower_pots $(id).display

function gm4_blossoming_pots:flower/set_displays with storage gm4_blossoming_pots:flower_pots temp

# sound
$execute positioned ~ ~-0.3125 ~ run function gm4_blossoming_pots:play_sound with storage gm4_blossoming_pots:flower_pots $(id)

kill @s
