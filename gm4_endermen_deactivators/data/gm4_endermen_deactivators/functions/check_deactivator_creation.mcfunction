#@s=emerald on wither skull on grass block on cobblestone wall (N,W,E,S=false, Up=true)]

#check if ender pearl
execute unless entity @e[type=armor_stand,tag=gm4_end_deact,dx=0,dy=-2,dz=0] if entity @e[type=item,dx=0,dy=0,dz=0,nbt={Item:{id:"minecraft:ender_eye",Count:1b},OnGround:1b}] run function gm4_endermen_deactivators:create
