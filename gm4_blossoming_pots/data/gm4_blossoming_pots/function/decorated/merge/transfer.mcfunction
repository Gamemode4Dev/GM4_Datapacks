# transfer layer of a function using macros :(
# @s = temp marker inside decorated pot
# at @s align xyz positioned ~.5 ~.5 ~.5
# with storage gm4_blossoming_pots:decorated_pots temp
# run from decorated/merge/loop



# we need to
    # target select the right block display
        # use temp.number for numbered tag
        # limit=1,sort=nearest,distance=..0.2
    # data modify entity @s <PATH???> merge from storage gm4_blossoming_pots:decorated_pots $(temp.pot.id).$(temp.pot.count)[$(temp.number)]
# AAAAAA
# i have to go another function deeper

# bail out if there isnt anything to merge here
$execute unless data storage gm4_blossoming_pots:decorated_pots $(id).$(count) run return 1

$data modify storage gm4_blossoming_pots:decorated_pots temp.merge set from storage gm4_blossoming_pots:decorated_pots $(id).$(count)[$(number)]
$execute as @n[tag=gm4_blossoming_pots.display.decorated_pot.$(number),distance=..0.2] run function gm4_blossoming_pots:decorated/merge/display with storage gm4_blossoming_pots:decorated_pots temp
