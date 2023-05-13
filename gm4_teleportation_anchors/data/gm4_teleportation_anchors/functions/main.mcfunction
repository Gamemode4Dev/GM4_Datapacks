schedule function gm4_teleportation_anchors:main 16t

# jam mobs every 8 ticks
function gm4_teleportation_anchors:mob/jam_mob
schedule function gm4_teleportation_anchors:mob/jam_mob 8t

# teleportation jammers
## decrease buffer score
scoreboard players remove @e[scores={gm4_ta_jam_time=1..}] gm4_ta_jam_time 1
## unjam entities
scoreboard players reset @e[type=enderman,tag=gm4_ta_jammed,scores={gm4_ta_jam_time=..0}] gm4_ta_pos_x
scoreboard players reset @e[type=shulker,tag=gm4_ta_jammed,scores={gm4_ta_jam_time=..0}] gm4_ta_pos_x
execute as @e[type=enderman,tag=gm4_ta_jammed,scores={gm4_ta_jam_time=..0}] run data remove entity @s carriedBlockState
tag @e[tag=gm4_ta_jammed,scores={gm4_ta_jam_time=..0}] remove gm4_ta_jammed
## kill blocker armor stands (used to prevent jammed players from breaking/using blocks)
execute as @e[type=armor_stand,tag=gm4_ta_blocker] at @s unless entity @a[limit=1,distance=..0.1,tag=gm4_ta_teleported_player] run kill @s
## teleportation jammer processes
execute as @e[type=marker,tag=gm4_teleportation_jammer] at @s run function gm4_teleportation_anchors:blocks/jammer/process

# teleportation anchors
execute as @e[type=marker,tag=gm4_teleportation_anchor] at @s run function gm4_teleportation_anchors:blocks/anchor/process
## deal with jammed player
execute at @a[scores={gm4_ta_cooldown=1..}] run particle minecraft:block chorus_plant ~ ~0.5 ~ 0 0 0 0 3 force
scoreboard players remove @a[scores={gm4_ta_cooldown=1..}] gm4_ta_cooldown 1
