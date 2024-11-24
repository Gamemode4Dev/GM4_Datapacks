# Dispatch for operations concerning the flower pots plants
# @s = temp marker inside flower pot
# at @s align xyz positioned ~.5 ~.5 ~.5
# run from flower/as_player

execute \
    unless data entity @s data.id \
    run return run function gm4_blossoming_pots:flower/item/give_back with entity @s data

# summon the required amount of block displays, without data
    # summon is also responsible summoning perma flower pot marker
execute \
    unless entity @e[type=minecraft:block_display,tag=gm4_blossoming_pots.display.flower_pot,distance=..0.2] \
    run function gm4_blossoming_pots:flower/summon/initialize with entity @s data

# merge the data of the corresponding item amount variant with the block displays there
    # merge is responsible for decrementing player item count, incrementing perma pot marker item count
execute \
    if entity @e[type=minecraft:block_display,tag=gm4_blossoming_pots.display.flower_pot,distance=..0.2] \
    run function gm4_blossoming_pots:flower/merge/initialize with entity @s data

# if merge score 0, succesfully merged data, play sound?
    # merge or summon?
        # merge score 0 triggers every pot interact, not ideal
        # summon score 0 triggers only on first summon, not ideal either, but better
    # ideally, we would only play sound on successful CHANGE, and not on just right click
execute if score @s gm4_blossoming_pots.merge_loop matches 0 run function gm4_blossoming_pots:flower/sound/find with entity @s data

# kill marker
kill @s
