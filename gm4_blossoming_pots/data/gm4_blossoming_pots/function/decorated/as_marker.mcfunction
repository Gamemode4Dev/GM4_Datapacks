# Dispatch for operations concerning the decorated pots plants
# @s = temp marker inside decorated pot
# at @s align xyz positioned ~.5 ~.5 ~.5
# run from decorated/as_player

# summon the required amount of block displays, without data
execute \
    unless entity @e[type=minecraft:block_display,tag=gm4_blossoming_pots.display.decorated_pot,distance=..0.2] \
    run function gm4_blossoming_pots:decorated/summon/initialize with block ~ ~ ~ item

# if new block displays summoned, catch it up to count
execute if score @s gm4_blossoming_pots.summon_loop matches 0 \
    run function gm4_blossoming_pots:decorated/catch_up/initialize

# merge the data of the corresponding item amount variant with the block displays there
execute \
    if entity @e[type=minecraft:block_display,tag=gm4_blossoming_pots.display.decorated_pot,distance=..0.2] \
    run function gm4_blossoming_pots:decorated/merge/initialize with block ~ ~ ~ item

# if merge score 0, succesfully merged data, play sound?
    # merge or summon?
        # merge score 0 triggers every pot interact, not ideal
        # summon score 0 triggers only on first summon, not ideal either, but better
    # ideally, we would only play sound on successful CHANGE, and not on just right click
execute if score @s gm4_blossoming_pots.summon_loop matches 0 run function gm4_blossoming_pots:decorated/sound/find with block ~ ~ ~ item

# kill marker
kill @s
