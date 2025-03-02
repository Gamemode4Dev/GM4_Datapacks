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

# store dropped items data in temp and kill it
execute as @n[type=minecraft:item,distance=..0.5,nbt={Age:0s},predicate=gm4_blossoming_pots:item_potable] run function gm4_blossoming_pots:vanilla_pot_handling/get_dropped_item

# giving item back is run from as_player following this.
scoreboard players set $signal_give_back gm4_blossoming_pots.misc 1

# kill marker
kill @s
