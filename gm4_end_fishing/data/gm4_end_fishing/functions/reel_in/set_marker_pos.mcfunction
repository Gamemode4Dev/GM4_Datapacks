# @s = marker to spawn item loot
# run from reel_in/reel_loot

tp @s ~ ~ ~ facing entity @a[tag=gm4_ef_reel_loot,limit=1] eyes
function gm4_end_fishing:reel_in/move_marker
execute at @s if entity @a[distance=..2,tag=gm4_ef_reel_loot,limit=1] if block ^ ^ ^0.5 #gm4:no_collision run tp @s ^ ^ ^0.5
execute at @s if entity @a[distance=..2,tag=gm4_ef_reel_loot,limit=1] if block ^ ^ ^0.5 #gm4:no_collision run tp @s ^ ^ ^0.5
