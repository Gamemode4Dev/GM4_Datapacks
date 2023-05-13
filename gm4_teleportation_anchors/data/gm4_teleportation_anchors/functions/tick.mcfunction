execute at @e[type=marker,tag=gm4_ta_end_gateway] positioned ~-.55 ~-256.55 ~-.55 align xyz as @e[type=!#gm4_teleportation_anchors:affected,tag=gm4_ta_jammed,tag=!gm4_ta_teleported_player,dx=2.1,dy=2.1,dz=2.1] at @s run function gm4_teleportation_anchors:mob/enter_end_gateway

execute as @e[type=enderman,tag=gm4_ta_jammed,scores={gm4_ta_jam_time=1..}] unless data entity @s carriedBlockState run data merge entity @s {carriedBlockState:{Name:"tall_seagrass",Properties:{half:"upper"}}}

schedule function gm4_teleportation_anchors:tick 1t
