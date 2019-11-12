#the start of the module
execute as @e[type=item,nbt={Dimension:0,Item:{id:"minecraft:glass_bottle",tag:{gm4_fireflies:1b}}}] at @s run function fireflies:process_bottle
execute as @e[type=item,nbt={Dimension:0,Item:{id:"minecraft:glass_bottle",tag:{display:{Name:"{\"text\":\"FireFlies\"}"}}},OnGround:1b}] at @s run function fireflies:process_bottle

execute store result score time gm4_fireflies run time query daytime
execute if score time gm4_fireflies <= 23000 gm4_fireflies if score time gm4_fireflies >= 13000 gm4_fireflies run function fireflies:night
execute unless score time gm4_fireflies = 23000 gm4_fireflies as @e[type=armor_stand, tag=gm4_firefly] at @s run function fireflies:process_day

#destroy
execute as @e[tag=gm4_firefly] at @s if block ~ ~1 ~ stone_button[face=floor] run function fireflies:destroy
