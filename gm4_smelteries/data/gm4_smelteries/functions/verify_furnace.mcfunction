# check furnace and store cooktime
# called by process

scoreboard players set @s gm4_bf_data -1
execute store result score @s gm4_bf_data run data get block ^ ^ ^1 CookTime

# display ore
execute if score @s gm4_bf_data matches 0.. run function gm4_smelteries:check_ore
