#@s=endermen_deactivator_dead armour stand
#from clock

#reactivation check
execute at @s if entity @e[type=item,distance=..1,nbt={Item:{id:"minecraft:emerald",Count:1b},OnGround:1b}] if entity @e[type=item,distance=..1,nbt={Item:{id:"minecraft:ender_eye",Count:1b},OnGround:1b}] run function gm4_endermen_deactivators:reactivate