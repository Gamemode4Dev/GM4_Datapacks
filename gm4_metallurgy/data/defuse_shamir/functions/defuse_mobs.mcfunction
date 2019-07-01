#@s = at players wearing a defuse armor piece
#run from active
execute as @e[type=creeper,distance=..6] run data merge entity @s {Fuse:32767s,ExplosionRadius:0}
tag @e[type=bat,distance=..6] add gm4_defused_bat
tag @s remove gm4_trying_to_defuse
