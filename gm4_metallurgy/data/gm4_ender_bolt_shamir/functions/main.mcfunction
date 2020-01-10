#@s=player using ender bolt (dealt damage)
#run from metallurgy:main
#at @s

#ender bolt effects
particle portal ~ ~ ~ .1 .5 .1 .8 10
effect give @s wither 4 1 true

#spread
scoreboard players remove @s gm4_bolt_time 1
execute if score @s gm4_bolt_time matches 0 run scoreboard players reset @s gm4_bolt_time
execute as @e[distance=..1.6,nbt={DeathTime:0s},type=!armor_stand,type=!player] unless score @s gm4_bolt_time matches 1.. run scoreboard players set @s gm4_bolt_time 20
