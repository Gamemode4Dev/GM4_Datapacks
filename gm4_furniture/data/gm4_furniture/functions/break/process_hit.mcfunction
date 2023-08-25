
scoreboard players operation $check_break gm4_furniture_last_hit = $hit gm4_furniture_last_hit
scoreboard players operation $check_break gm4_furniture_last_hit -= @s gm4_furniture_last_hit
execute if score $creative gm4_furniture_data matches 1 run scoreboard players set $check_break gm4_furniture_last_hit 0

execute if score $check_break gm4_furniture_last_hit matches ..4 run function gm4_furniture:break/destroy
execute unless score $check_break gm4_furniture_last_hit matches ..4 run scoreboard players operation @s gm4_furniture_last_hit = $hit gm4_furniture_last_hit

playsound minecraft:entity.armor_stand.hit block @a[distance=..8] ~ ~ ~ 1 1
playsound minecraft:entity.player.attack.strong block @a[distance=..8] ~ ~ ~ 1 1
