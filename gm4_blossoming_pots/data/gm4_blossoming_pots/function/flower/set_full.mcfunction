# sets perma marker data to indicate it is full when its count reaches the same as storage's maximum
# @s = temp marker inside flower pot
# at @s align xyz positioned ~.5 ~.5 ~.5
# with {id, count}
# run from flower/as_marker

$execute if data storage gm4_blossoming_pots:flower_pots {"$(id)":{maximum:$(count)}} run data modify entity @n[type=minecraft:marker,tag=gm4_blossoming_pots.data.flower_pot,distance=..0.2] data.full set value 1
