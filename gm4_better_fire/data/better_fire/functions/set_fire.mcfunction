#set fire block
#@s - @e[type=minecraft:arrow,nbt=!{Fire:-1s}]
#called by better_fire:checks

#audiovisuals
playsound minecraft:block.fire.extinguish block @a[distance=..20] ~ ~ ~ 100 2

#set block
setblock ~ ~ ~ minecraft:fire
