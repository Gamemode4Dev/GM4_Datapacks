#@s = players with curse
#Run from main

scoreboard players add @s gm4_ee_time 1
execute if entity @s[nbt={Sleeping:1b}] run scoreboard players add @s gm4_ee_time 50

execute if score @s gm4_ee_time matches 563.. run scoreboard players remove @s gm4_ee_curse 1
execute if score @s gm4_ee_time matches 563.. run scoreboard players reset @s gm4_ee_time

execute if score @s gm4_ee_curse matches 50.. run effect give @s mining_fatigue 11 0 true
execute if score @s gm4_ee_curse matches 50.. run effect give @s weakness 11 0 true
execute if score @s gm4_ee_curse matches 50.. run effect give @s unluck 11 0
