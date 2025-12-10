# drop extra items from legacy flower pot
# @s = type=minecraft:marker, tag=rc_blossoming_pots.flowerPot
# at @s
# with {id, count}
# run from upgrade_paths/3.1/legacy_flower_pot

# Motion is predetermined. I can't be asked to make it random, shoot me.
$summon minecraft:item ~ ~.25 ~ {Item:{id:"$(id)",count:$(count)},Motion:[0.03d,0.2d,0.02d]}
