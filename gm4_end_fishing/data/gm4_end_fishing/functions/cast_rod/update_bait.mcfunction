#@s = fishing bait armor stand (every 3 clock cycles)
#run from process

scoreboard players reset @s gm4_ef_up_bait

#destruction
execute if entity @s[tag=gm4_ef_marker] positioned ~ ~ ~ unless entity @e[type=minecraft:fishing_bobber,distance=..0.0001] run kill @s
execute unless block ~ ~ ~ #gm4:no_collision run kill @s

#make marker
execute unless entity @s[tag=gm4_ef_marker] positioned ~ ~0.79 ~ if entity @e[type=minecraft:fishing_bobber,limit=1,sort=nearest,distance=..0.0001] run function gm4_end_fishing:cast_rod/marker
kill @s[tag=!gm4_ef_marker]
