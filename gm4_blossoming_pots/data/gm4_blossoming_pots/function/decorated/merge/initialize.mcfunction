# Intializes the loop for merging block display data
# @s = temp marker inside decorated pot
# at @s align xyz positioned ~.5 ~.5 ~.5
# with block ~ ~ ~ item
# run from decorated/as_marker


# we'll need a loop function to iterate over the index in storage and the cooresponding tags of block displays within range of marker
    # n -> 0 stop when 0
$execute unless data storage gm4_blossoming_pots:decorated_pots $(id) run return 1
# store pot data in temp
$data modify storage gm4_blossoming_pots:decorated_pots temp set value {id:"$(id)",count:$(count)}

# set score of marker to the display count of the item in the pot, (number of block displays to modify)
$execute store result score @s gm4_blossoming_pots.merge_loop run data get storage gm4_blossoming_pots:decorated_pots $(id).display_count

# now, the rotation is stored, the pot data is stored, the scoreboard is set up
function gm4_blossoming_pots:decorated/merge/loop

# clear temp
data remove storage gm4_blossoming_pots:decorated_pots temp