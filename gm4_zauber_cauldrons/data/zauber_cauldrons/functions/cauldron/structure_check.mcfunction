#@s=zauber Cauldron
#run from main

#check structure
scoreboard players set @s gm4_zc_data 1
execute unless block ~ ~ ~ cauldron run kill @s
execute if block ~ ~ ~ cauldron[level=0] run scoreboard players set @s gm4_zc_data 0
execute if score @s gm4_zc_data matches 1 unless block ~ ~-1 ~ fire run scoreboard players set @s gm4_zc_data 0

#rabbit teleportation
execute if score @s gm4_zc_data matches 0 if block ~ ~ ~ cauldron[level=0] align xyz if entity @e[type=rabbit,dx=0,dy=0,dz=0] if entity @a[gamemode=!spectator,nbt={Inventory:[{Slot:100b,tag:{gm4_zauber_cauldrons:{item:"zauber_armor"}}},{Slot:101b,tag:{gm4_zauber_cauldrons:{item:"zauber_armor"}}},{Slot:102b,tag:{gm4_zauber_cauldrons:{item:"zauber_armor"}}},{Slot:103b,tag:{gm4_zauber_cauldrons:{item:"zauber_armor"}}}]},distance=..2] run function zauber_cauldrons:cauldron/rabbit_teleportation

#run final inits on valid structures
execute if score @s gm4_zc_data matches 1 run function zauber_cauldrons:cauldron/valid_structure
