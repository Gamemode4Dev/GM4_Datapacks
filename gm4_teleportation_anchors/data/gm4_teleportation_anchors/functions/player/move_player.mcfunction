# @s = none
# located at world spawn
# run from tick

scoreboard players remove timer gm4_ta_jam_pl 1
scoreboard players remove @a[tag=gm4_ta_teleported] gm4_ta_jam_pl 1
execute as @a[tag=gm4_ta_teleported,scores={gm4_ta_jam_pl=19}] at @s run function gm4_teleportation_anchors:player/set_location
execute as @a[tag=gm4_ta_teleported,scores={gm4_ta_jam_pl=..18}] at @s run function gm4_teleportation_anchors:player/find_aec
