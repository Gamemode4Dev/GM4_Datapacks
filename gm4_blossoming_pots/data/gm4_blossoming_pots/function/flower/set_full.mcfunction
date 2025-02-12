# Sets perma marker full tag to full when its count reaches the same as storage's maximum
# @s = perma marker inside flower pot
# at @s align xyz positioned ~.5 ~.5 ~.5
# with {id, count}
# run from flower/update_count

$execute if data storage gm4_blossoming_pots:flower_pots {"$(id)":{maximum:$(count)}} run data modify entity @s data.gm4_blossoming_pots.full set value 1
