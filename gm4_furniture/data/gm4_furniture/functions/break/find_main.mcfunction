
execute store result score $hit gm4_furniture_last_hit run time query gametime
scoreboard players operation $check_id gm4_furniture_id = @s gm4_furniture_id
execute as @e[type=interaction,tag=gm4_furniture.main,distance=..8] if score @s gm4_furniture_id = $check_id gm4_furniture_id at @s run function gm4_furniture:break/process_hit
data remove entity @s attack
