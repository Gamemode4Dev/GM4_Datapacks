#set fire block
#@s - @e[type=minecraft:arrow,nbt=!{Fire:-1s}]
#called by better_fire:checks

#audiovisuals
execute if data entity @s inBlockState if block ~ ~ ~ #better_fire:air run playsound minecraft:block.fire.extinguish block @a[distance=..20] ~ ~ ~ 100 2

#set block
setblock ~ ~ ~ minecraft:fire
