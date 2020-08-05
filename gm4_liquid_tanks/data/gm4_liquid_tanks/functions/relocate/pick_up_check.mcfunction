# @s = player who placed a relocator player head
# located at the block the head was placed on
# run from #gm4_relocators:pick_up

execute if block ~ ~ ~ hopper{Items:[]} align xyz as @e[type=armor_stand,tag=gm4_liquid_tank,dx=0,dy=-.1,dz=0,limit=1] at @s run function gm4_liquid_tanks:relocate/pick_up
