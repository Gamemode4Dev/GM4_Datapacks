# Flower pot cleanup if display isn't in a flower pot
# @s = flower pot display 0
# at @s
# with {id}
# run from main

# kill displays
kill @e[type=minecraft:block_display,tag=gm4_blossoming_pots.display.flower_pot,distance=..0.1]

# Motion is predetermined. I can't be asked to make it random, shoot me.
$summon minecraft:item ~ ~-.25 ~ {Item:{id:"$(id)",count:1},Motion:[0.03d,0.2d,0.02d]}
