#@s = people with levity boots, sneaking.
#at @s
#run from levity_shamir:find_floating_players

#creation of new region, check for boots in case player took them of (bugfix)
execute if entity @s[nbt={OnGround:1b,Inventory:[{Slot:100b,tag:{gm4_metallurgy:{active_shamir:"levity"}}}]}] run function levity_shamir:initiate_region

#outside region
execute if entity @s[nbt={OnGround:0b,Inventory:[{Slot:100b,tag:{gm4_metallurgy:{active_shamir:"levity"}}}]},tag=!gm4_levity_started_floating] run function levity_shamir:initiate_drifting

particle cloud ~ ~ ~ .2 .1 .2 .001 2 normal @a
