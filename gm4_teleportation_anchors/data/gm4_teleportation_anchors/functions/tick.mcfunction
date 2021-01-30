execute at @e[type=area_effect_cloud,tag=gm4_ta_end_gateway] positioned ~-.55 ~-256.55 ~-.55 align xyz as @e[type=!#gm4_teleportation_anchors:affected,tag=gm4_ta_jammed,tag=!gm4_ta_teleported_player,dx=2.1,dy=2.1,dz=2.1] at @s run function gm4_teleportation_anchors:mob/enter_end_gateway

schedule function gm4_teleportation_anchors:tick 1t
