#@s = fishing bait armor stand to be turned into a marker
#run from process

#make marker
data merge entity @s {Marker:1}
tag @s add gm4_ef_marker
summon item ~ ~ ~ {NoGravity:1,PickupDelay:32767,Age:6000,Item:{id:"minecraft:stone_button",Count:1}}
