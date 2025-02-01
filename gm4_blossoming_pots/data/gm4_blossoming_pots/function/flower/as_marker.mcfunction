# Sets up loop for plant stage changes
# @s = temp marker inside flower pot
# at @s align xyz positioned ~.5 ~.5 ~.5
# with {UUID, id, rotation}
# run from flower/as_player

# early returns
# if empty hand, empty the pot, give player the item
execute \
    if data storage gm4_blossoming_pots:flower_pots {temp:{id:"null"}} \
    run return run function gm4_blossoming_pots:flower/item/give_back with storage gm4_blossoming_pots:flower_pots temp
# if storage doesn't have, doesnt matter
$execute unless data storage gm4_blossoming_pots:flower_pots $(id) run return run kill @s
# if flower pot is full, return
execute if data entity @n[type=minecraft:marker,tag=gm4_blossoming_pots.data.flower_pot,distance=..0.2] {data:{full:1}} run return run kill @s

# if no perma marker yet, summon it
$execute unless entity @n[type=minecraft:marker,tag=gm4_blossoming_pots.data.flower_pot,distance=..0.2] \
    run summon minecraft:marker ~ ~ ~ {Tags:["gm4_blossoming_pots.data.flower_pot","smithed.strict","smithed.entity"],data:{id:"$(id)",count:0,full:0},CustomName:'{"text":"gm4_blossoming_pots.flower_pot"}'}

# decrement player mainhand by 1
$execute as @p[nbt={UUID:$(UUID)},gamemode=!creative] run item modify entity @s weapon.mainhand gm4_blossoming_pots:count_decr
# increment perma marker count by 1
    # this is a nightmare of selectors
execute store result score @n[type=minecraft:marker,tag=gm4_blossoming_pots.data.flower_pot,distance=..0.2] gm4_blossoming_pots.loop \
    run data get entity @n[type=minecraft:marker,tag=gm4_blossoming_pots.data.flower_pot,distance=..0.2] data.count 1
scoreboard players add @n[type=minecraft:marker,tag=gm4_blossoming_pots.data.flower_pot,distance=..0.2] gm4_blossoming_pots.loop 1
execute store result entity @n[type=minecraft:marker,tag=gm4_blossoming_pots.data.flower_pot,distance=..0.2] data.count int 1 \
    run scoreboard players get @n[type=minecraft:marker,tag=gm4_blossoming_pots.data.flower_pot,distance=..0.2] gm4_blossoming_pots.loop
# set full if full
function gm4_blossoming_pots:flower/set_full with entity @n[type=minecraft:marker,tag=gm4_blossoming_pots.data.flower_pot,distance=..0.2] data

# setting temp
execute store result storage gm4_blossoming_pots:flower_pots temp.score int 1 run scoreboard players set @s gm4_blossoming_pots.loop 0
data modify storage gm4_blossoming_pots:flower_pots temp.count set from entity @n[type=minecraft:marker,tag=gm4_blossoming_pots.data.flower_pot,distance=..0.2] data.count
function gm4_blossoming_pots:flower/set_temp_data with storage gm4_blossoming_pots:flower_pots temp
function gm4_blossoming_pots:flower/store_array_len with storage gm4_blossoming_pots:flower_pots temp
# temp storage should now contain {rotation, score, id, count, data}

function gm4_blossoming_pots:flower/loop with storage gm4_blossoming_pots:flower_pots temp

$execute if score @s gm4_blossoming_pots.sound matches 1 as @a[distance=..16] \
    run function gm4_blossoming_pots:flower/play_sound with storage gm4_blossoming_pots:flower_pots $(id)

kill @s
