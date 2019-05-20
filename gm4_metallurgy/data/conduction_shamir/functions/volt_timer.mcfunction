# @s = players holding conduction tool with volt time 0..
# at world spawn
# ran from conduction_shamir:main

#reduce gm4_volt_time
scoreboard players remove @s gm4_volt_time 1

#graphics
#show charge indicator
title @s times 0 20 0
#show grey marker if not enough damage dealt yet
execute unless score @s gm4_volt_damage matches 3000.. run title @s title ["",{"text":"⚡","color":"gray"}]
#show yellow marker if enough damage dealt
execute if score @s gm4_volt_damage matches 3000.. run title @s title ["",{"text":"⚡","color":"yellow"}]
#blinking effect if time is about to be up
execute if score @s gm4_volt_time matches 0 run title @s times 0 0 0
execute if score @s gm4_volt_time matches 2 run title @s times 0 0 0
execute if score @s gm4_volt_time matches 4 run title @s times 0 0 0
execute if score @s gm4_volt_time matches 6 run title @s times 0 0 0
