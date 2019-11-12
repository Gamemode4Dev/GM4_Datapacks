#night process

#disable day process
scoreboard players set time gm4_fireflies 23000

execute as @e[type=armor_stand,tag=gm4_firefly] at @s run function fireflies:process_night
execute as @e[type=armor_stand,tag=gm4_firefly,sort=random] at @s run function fireflies:process_ambient
