# Sets up loop for plant stage changes
# @s = temp entity inside flower pot
# at @s align xyz positioned ~.5 ~.5 ~.5
# with {id, rotation}
# run from flower/raycast and upgrade_paths/3.1/legacy_flower_pot

# early returns
# if empty hand, empty the pot, give player the item
execute \
    if data storage gm4_blossoming_pots:flower_pots {temp:{id:"null"}} \
    run return run function gm4_blossoming_pots:flower/remove_plant
# if storage doesn't have, doesnt matter
$execute unless data storage gm4_blossoming_pots:flower_pots $(id) run return run kill @s
# if flower pot is full, return
execute if data entity @e[type=minecraft:marker,tag=gm4_blossoming_pots.data.flower_pot,distance=..0.1,limit=1] {data:{gm4_blossoming_pots:{full:1}}} run return run kill @s

# if no perma marker yet, summon it
$execute unless entity @e[type=minecraft:marker,tag=gm4_blossoming_pots.data.flower_pot,distance=..0.1,limit=1] \
    run summon minecraft:marker ~ ~ ~ {Tags:["gm4_blossoming_pots.data.flower_pot","smithed.strict","smithed.entity"],data:{gm4_blossoming_pots:{id:"$(id)",count:0,full:0}},CustomName:'{"text":"gm4_blossoming_pots.flower_pot"}'}

# signal player mainhand to be decremented by as_player
scoreboard players set $signal_item_decr gm4_blossoming_pots.misc 1
# increment perma marker count by 1
execute as @e[type=minecraft:marker,tag=gm4_blossoming_pots.data.flower_pot,distance=..0.1,limit=1] run function gm4_blossoming_pots:flower/update_count

# setting temp
execute store result storage gm4_blossoming_pots:flower_pots temp.display_number int 1 run scoreboard players set $display_number gm4_blossoming_pots.misc 0
# temp.count set in flower/update_count
function gm4_blossoming_pots:flower/set_temp_data with storage gm4_blossoming_pots:flower_pots temp
function gm4_blossoming_pots:flower/store_array_len with storage gm4_blossoming_pots:flower_pots temp
# temp storage should now contain {rotation, display_number, id, count, data}

function gm4_blossoming_pots:flower/set_displays with storage gm4_blossoming_pots:flower_pots temp

$execute if score $play_sound gm4_blossoming_pots.misc matches 1 \
    positioned ~ ~-0.3125 ~ \
    run function gm4_blossoming_pots:play_sound with storage gm4_blossoming_pots:flower_pots $(id)

kill @s
