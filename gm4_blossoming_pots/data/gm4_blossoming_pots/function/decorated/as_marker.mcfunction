# Decides if loop_init should use maximum or count
# @s = temp marker inside decorated pot
# at @s align xyz positioned ~.5 ~.5 ~.5
# with block ~ ~ ~ item
# run from decorated/as_player

# early return
$execute unless data storage gm4_blossoming_pots:decorated_pots $(id) run return run kill @s

$execute store result score @s gm4_blossoming_pots.loop run data get storage gm4_blossoming_pots:decorated_pots $(id).maximum
# if over maximum use maximum as count
$execute unless score @s gm4_blossoming_pots.loop matches $(count).. \
    run data modify storage gm4_blossoming_pots:decorated_pots temp.count set from storage gm4_blossoming_pots:decorated_pots $(id).maximum
# if not, just use count as is
$execute if score @s gm4_blossoming_pots.loop matches $(count).. run data modify storage gm4_blossoming_pots:decorated_pots temp.count set value $(count)

$data merge storage gm4_blossoming_pots:decorated_pots {temp:{id:"$(id)"}}

function gm4_blossoming_pots:decorated/loop_init with storage gm4_blossoming_pots:decorated_pots temp

kill @s
