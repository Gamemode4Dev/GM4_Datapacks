# Intializes the loop for summoning required block displays
# @s = temp marker inside flower pot
# at @s align xyz positioned ~.5 ~.5 ~.5
# with entity @s data
# run from flower/as_marker

$execute unless data storage gm4_blossoming_pots:flower_pots $(id) run return fail
# valid item, summon perma marker
$summon minecraft:marker ~ ~ ~ {Tags:["gm4_blossoming_pots.data.flower_pot","smithed.strict","smithed.entity"],data:{id:"$(id)",count:0},CustomName:'{"text":"gm4_blossoming_pots.flower_pot"}'}

# merge rotation data from marker into storage
data modify storage gm4_blossoming_pots:flower_pots temp.marker set from entity @s data.rotation

# set score of marker to the display count of the item in the pot, (number of block displays to summon)
$execute store result score @s gm4_blossoming_pots.summon_loop run data get storage gm4_blossoming_pots:flower_pots $(id).display_count

# now, the rotation is stored, the pot data is stored, the scoreboard is set up
function gm4_blossoming_pots:flower/summon/loop

# clear temp
data remove storage gm4_blossoming_pots:flower_pots temp
return 1
