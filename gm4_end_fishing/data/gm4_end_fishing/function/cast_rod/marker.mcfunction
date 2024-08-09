# @s = fishing bait armor stand to be turned into a marker
# run from cast_rod/update_bait

# make marker
data merge entity @s {Marker:1}
tag @s add gm4_ef_marker
summon minecraft:armor_stand ~ ~ ~ {Small:1b,Invisible:1b,Tags:["gm4_ef_bobber_update"]}
schedule function gm4_end_fishing:go_fish/update_bobber 1t
