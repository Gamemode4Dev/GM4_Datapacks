# process hit furniture
# @s = furniture main interaction entity
# at @s
# run from break/find_main

# if player is holding the paintbrush instead grab the color and stop this function
execute if score $get_color gm4_furniture_data matches 1 if entity @s[tag=gm4_furniture.dyeable] run return run function gm4_furniture:break/get_color

# check how much time has passed since the last hit (or ignore that if the player was in creative)
execute store result score $hit gm4_furniture_last_hit run time query gametime
scoreboard players operation $check_break gm4_furniture_last_hit = $hit gm4_furniture_last_hit
scoreboard players operation $check_break gm4_furniture_last_hit -= @s gm4_furniture_last_hit

# if >=4 ticks have passed or player is in creative destroy furniture
execute if score $creative gm4_furniture_data matches 1 run scoreboard players set $check_break gm4_furniture_last_hit 0
execute if score $check_break gm4_furniture_last_hit matches ..4 run function gm4_furniture:break/destroy
# otherwise store this hit time in furniture's score for the next check
execute unless score $check_break gm4_furniture_last_hit matches ..4 run scoreboard players operation @s gm4_furniture_last_hit = $hit gm4_furniture_last_hit

# hit sounds
playsound minecraft:entity.armor_stand.hit block @a[distance=..8] ~ ~ ~ 1 1
playsound minecraft:entity.player.attack.strong block @a[distance=..8] ~ ~ ~ 1 1
