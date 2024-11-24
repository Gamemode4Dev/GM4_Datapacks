# summons items of perma marker's storage, and kills perma marker on flower pot breakage
# @s = flower pot perma marker
# at @s
# with entity @s data
# run from main

# just summonining an item so not giving it smithed.entity
# Motion is predetermined. I can't be asked to make it random, shoot me.
$summon minecraft:item ~ ~-.25 ~ {Item:{id:"$(id)",count:$(count)},Motion:[0.03d,0.2d,0.02d]}
kill @s