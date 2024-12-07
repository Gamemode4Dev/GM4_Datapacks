# sets rotation data of the new temp marker from players, sets item id from players selected item, and stores players UUID in the temp marker for later
# @s = player who interacted with a flower pot
# at @s anchored eyes, then marched forward 0.005 over and over. This should be in the same spot as the new temp marker
# run from flower/raycast/loop

data modify entity @n[type=minecraft:marker,tag=gm4_blossoming_pots.temp.flower_pot,distance=..0.01] data.id set from entity @s SelectedItem.id
data modify entity @n[type=minecraft:marker,tag=gm4_blossoming_pots.temp.flower_pot,distance=..0.01] data.UUID set from entity @s UUID

# player facing west
execute if entity @s[y_rotation=45..135] run return run data merge entity @n[type=minecraft:marker,tag=gm4_blossoming_pots.temp.flower_pot,distance=..0.01] {data:{rotation:0}}
# player facing north
execute if entity @s[y_rotation=135..225] run return run data merge entity @n[type=minecraft:marker,tag=gm4_blossoming_pots.temp.flower_pot,distance=..0.01] {data:{rotation:90}}
# player facing east
execute if entity @s[y_rotation=225..315] run return run data merge entity @n[type=minecraft:marker,tag=gm4_blossoming_pots.temp.flower_pot,distance=..0.01] {data:{rotation:180}}
# player facing south
execute if entity @s[y_rotation=315..405] run return run data merge entity @n[type=minecraft:marker,tag=gm4_blossoming_pots.temp.flower_pot,distance=..0.01] {data:{rotation:-90}}
