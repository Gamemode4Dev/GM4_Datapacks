# Intializes the loop for merging block display data
# @s = temp marker inside flower pot
# at @s align xyz positioned ~.5 ~.5 ~.5
# with entity @s data
# run from flower/as_marker


# we'll need a loop function to iterate over the index in storage and the cooresponding tags of block displays within range of marker
    # n -> 0 stop when 0
$execute unless data storage gm4_blossoming_pots:flower_pots $(id) run return fail

# check if player selected item matches perma marker item, fail if different
$execute unless data entity @n[type=minecraft:marker,tag=gm4_blossoming_pots.data.flower_pot,distance=..0.2] {data:{id:"$(id)"}} run return fail

# prevent overfill
execute if data entity @n[type=minecraft:marker,tag=gm4_blossoming_pots.data.flower_pot,distance=..0.2] {data:{full:1}} run return fail

# decrement player mainhand by 1
$execute as @p[nbt={UUID:$(UUID)},gamemode=!creative] run item modify entity @s weapon.mainhand gm4_blossoming_pots:count_decr

# increment perma marker count by 1
    # this is a nightmare of selectors
        # could tag it at the start of the function to have this be just checking that one tag?
execute store result score @n[type=minecraft:marker,tag=gm4_blossoming_pots.data.flower_pot,distance=..0.2] gm4_blossoming_pots.merge_loop \
    run data get entity @n[type=minecraft:marker,tag=gm4_blossoming_pots.data.flower_pot,distance=..0.2] data.count 1
scoreboard players add @n[type=minecraft:marker,tag=gm4_blossoming_pots.data.flower_pot,distance=..0.2] gm4_blossoming_pots.merge_loop 1
execute store result entity @n[type=minecraft:marker,tag=gm4_blossoming_pots.data.flower_pot,distance=..0.2] data.count int 1 \
    run scoreboard players get @n[type=minecraft:marker,tag=gm4_blossoming_pots.data.flower_pot,distance=..0.2] gm4_blossoming_pots.merge_loop

# set temp id and count
$data modify storage gm4_blossoming_pots:flower_pots temp set value {id:"$(id)"}
data modify storage gm4_blossoming_pots:flower_pots temp.count set from entity @n[type=minecraft:marker,tag=gm4_blossoming_pots.data.flower_pot,distance=..0.2] data.count

# set full if full
function gm4_blossoming_pots:flower/merge/check_full with entity @n[type=minecraft:marker,tag=gm4_blossoming_pots.data.flower_pot,distance=..0.2] data

# set score of marker to the display count of the item in the pot, (number of block displays to modify)
$execute store result score @s gm4_blossoming_pots.merge_loop run data get storage gm4_blossoming_pots:flower_pots $(id).display_count

# now, the rotation is stored, the pot data is stored, the scoreboard is set up
function gm4_blossoming_pots:flower/merge/loop

# clear temp
data remove storage gm4_blossoming_pots:flower_pots temp
return 1
