#check for arrow that places a tnt or crop
execute as @e[type=minecraft:arrow,tag=gm4_cb_tnt,nbt={inGround:1b}] at @s run function gm4_crossbow_cartridges:tnt/tnt_check
execute if entity @e[type=minecraft:arrow,tag=gm4_cb_tnt,limit=1] run schedule function gm4_crossbow_cartridges:tnt/tnt_loop 16t
