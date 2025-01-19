# If player is placing a vanilla plant in custom flower pot, prevent them and give them the item back
# @s = temp marker inside filled vanilla flower pot
# at @s align xyz positioned ~.5 ~.5 ~.5
# run from flower/vanilla_pots/as_player

#check block location for tagged display or perma marker?
execute \
    unless entity @e[type=minecraft:block_display,tag=gm4_blossoming_pots.display.flower_pot,distance=..0.2] \
    run return run kill @s
# if not found, return,     let the player place their vanilla pots in peace
# else 

fill ~ ~ ~ ~ ~ ~ minecraft:flower_pot destroy

# execute as the flower pot item exactly where it summons, kill 
execute as @n[type=minecraft:item,distance=..0.5,nbt={Item:{id:"minecraft:flower_pot"},Age:0s}] run kill @s

# execute as nearest item with 0 time removed, if predicate matches item tag for small pot items
    # store item data in temp, or marker lol
    # kill it
    # Use marker data (which has player UUID) to give player the item back, might need a macro function for that
execute run data modify entity @s data.id set from entity @n[type=minecraft:item,distance=..0.5,nbt={Age:0s},predicate=gm4_blossoming_pots:item_potable] Item.id
execute as @n[type=minecraft:item,distance=..0.5,nbt={Age:0s},predicate=gm4_blossoming_pots:item_potable] run kill @s
function gm4_blossoming_pots:flower/vanilla_pots/give_back with entity @s data

# kill marker
kill @s
