# Flower pot cleanup if marker isn't in a flower pot
# @s = flower pot perma marker
# at @s
# with {id, count}
# run from main and upgrade_paths/3.1/legacy_flower_pot

# kill associated displays
kill @e[type=minecraft:block_display,tag=gm4_blossoming_pots.display.flower_pot,distance=..0.1]

# just summonining an item so not giving it smithed.entity
# Motion is predetermined. I can't be asked to make it random, shoot me.
$summon minecraft:item ~ ~-.25 ~ {Item:{id:"$(id)",count:$(count)},Motion:[0.03d,0.2d,0.02d]}
kill @s
