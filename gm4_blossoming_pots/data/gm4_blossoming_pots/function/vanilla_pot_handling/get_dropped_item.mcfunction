# Gets the id off of the fresh item and then kills it
# @s = age:0s item of vanilla flower pot
# at temp marker align xyz positioned ~.5 ~.5 ~.5
# run from vanilla_pot_handling/as_marker


execute run data modify storage gm4_blossoming_pots:flower_pots temp.id set from entity @s Item.id
kill @s
