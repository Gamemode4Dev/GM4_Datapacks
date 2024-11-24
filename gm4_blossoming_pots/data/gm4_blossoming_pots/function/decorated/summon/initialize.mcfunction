# Intializes the loop for summoning required block displays
# @s = temp marker inside decorated pot
# at @s align xyz positioned ~.5 ~.5 ~.5
# with block ~ ~ ~ item
# run from decorated/as_marker

$execute unless data storage gm4_blossoming_pots:decorated_pots $(id) run return 1
# merge rotation data from marker into storage
data modify storage gm4_blossoming_pots:decorated_pots temp.marker set from entity @s data.rotation

# set score of marker to the display count of the item in the pot, (number of block displays to summon)
$execute store result score @s gm4_blossoming_pots.summon_loop run data get storage gm4_blossoming_pots:decorated_pots $(id).display_count

# now, the rotation is stored, the pot data is stored, the scoreboard is set up
function gm4_blossoming_pots:decorated/summon/loop

# clear temp
data remove storage gm4_blossoming_pots:decorated_pots temp