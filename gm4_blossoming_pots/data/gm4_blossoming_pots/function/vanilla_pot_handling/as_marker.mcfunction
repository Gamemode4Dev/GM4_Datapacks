# If player is placing a vanilla plant in custom flower pot, prevent them and give them the item back
# @s = temp marker inside filled vanilla flower pot
# at @s align xyz positioned ~.5 ~.5 ~.5
# run from vanilla_pot_handling/raycast

#check block location for tagged display or perma marker?
execute \
    unless entity @e[type=minecraft:block_display,tag=gm4_blossoming_pots.display.flower_pot,distance=..0.1,limit=1] \
    run return run kill @s
# if not found, return,     let the player place their vanilla pots in peace
# else 

fill ~ ~ ~ ~ ~ ~ minecraft:flower_pot destroy

# execute as the flower pot item exactly where it summons, kill 
execute as @n[type=minecraft:item,distance=..0.5,nbt={Item:{id:"minecraft:flower_pot"},Age:0s}] run kill @s

# execute as nearest item with 0 time removed, if predicate matches item tag for small pot items
    # store item data in temp
    # kill it
    # Use temp storage to give player the item back, need a macro function for that
execute as @n[type=minecraft:item,distance=..0.5,nbt={Age:0s},predicate=gm4_blossoming_pots:item_potable] run function gm4_blossoming_pots:vanilla_pot_handling/get_dropped_item
function gm4_blossoming_pots:vanilla_pot_handling/give_item_back with storage gm4_blossoming_pots:flower_pots temp

# kill marker
kill @s
