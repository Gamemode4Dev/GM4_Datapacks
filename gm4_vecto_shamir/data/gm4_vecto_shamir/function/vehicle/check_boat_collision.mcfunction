# @s = player with shamir equipped, sneaking above water
# positioned in water
# run from position_check

execute positioned ^ ^-.4 ^1 if block ^.7 ^ ^ #gm4:no_collision if block ^-.7 ^ ^ #gm4:no_collision if block ^ ^ ^1 #gm4:no_collision if block ^.7 ^ ^1 #gm4:no_collision if block ^-.7 ^ ^1 #gm4:no_collision if block ^.7 ^1 ^ #gm4:no_collision if block ^ ^1 ^ #gm4:no_collision if block ^-.7 ^1 ^ #gm4:no_collision if block ^ ^1 ^1 #gm4:no_collision if block ^.7 ^1 ^1 #gm4:no_collision if block ^-.7 ^1 ^1 #gm4:no_collision run function gm4_vecto_shamir:vehicle/spawn_boat
