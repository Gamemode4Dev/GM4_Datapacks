# @s=zauber Cauldron
# at @s
# run from main

# check structure
scoreboard players set @s gm4_zc_data 1
execute unless block ~ ~ ~ cauldron run kill @s
execute if block ~ ~ ~ cauldron[level=0] run scoreboard players set @s gm4_zc_data 0
# check for fire
execute if score @s gm4_zc_data matches 1 unless block ~ ~-1 ~ fire run scoreboard players set @s gm4_zc_data 0
execute if score @s gm4_zc_data matches 1 if block ~ ~-3 ~ soul_sand run scoreboard players set has_blue_fire gm4_zc_data 1
# UPDATE COMMENT: CHANGE L10 to #fire and L11 to ~ ~-1 ~ soul_fire once 1.16 is out.

# rabbit teleportation
execute if score @s gm4_zc_data matches 0 if block ~ ~ ~ cauldron[level=0] align xyz if entity @e[type=rabbit,dx=0,dy=0,dz=0] if entity @a[gamemode=!spectator,predicate=gm4_zauber_cauldrons:player/equipment/armor/full,distance=..2] run function gm4_zauber_cauldrons:cauldron/rabbit_teleportation

# run final inits on valid structures
execute if score @s gm4_zc_data matches 1 run function gm4_zauber_cauldrons:cauldron/valid_structure

# reset fake players
scoreboard players reset has_blue_fire gm4_zc_data
