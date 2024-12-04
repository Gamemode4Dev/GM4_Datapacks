# get a location for volatile pillar
# @s = pillar marker
# at @s
# run from mob/process/elite/volatile/process

tag @s add gm4_mu_elite.volatile_pillar
execute store result score @s gm4_mu_timer run random value 0..14
execute store result score @s gm4_mu_data run random value 2..5
scoreboard players operation @s gm4_mu_timer -= @s gm4_mu_data
scoreboard players operation @s gm4_mu_timer -= @s gm4_mu_data

execute store result score $randomX gm4_mu_data run random value 0..12
execute store result score $randomZ gm4_mu_data run random value 0..12
tp @s ~-6 ~ ~-6

execute at @s if score $randomX gm4_mu_data matches 8.. run tp @s ~8 ~ ~
execute if score $randomX gm4_mu_data matches 8.. run scoreboard players remove $randomX gm4_mu_data 8
execute at @s if score $randomX gm4_mu_data matches 4.. run tp @s ~4 ~ ~
execute if score $randomX gm4_mu_data matches 4.. run scoreboard players remove $randomX gm4_mu_data 4
execute at @s if score $randomX gm4_mu_data matches 2.. run tp @s ~2 ~ ~
execute if score $randomX gm4_mu_data matches 2.. run scoreboard players remove $randomX gm4_mu_data 2
execute at @s if score $randomX gm4_mu_data matches 1.. run tp @s ~1 ~ ~
execute if score $randomX gm4_mu_data matches 1.. run scoreboard players remove $randomX gm4_mu_data 1

execute at @s if score $randomZ gm4_mu_data matches 8.. run tp @s ~ ~ ~8
execute if score $randomZ gm4_mu_data matches 8.. run scoreboard players remove $randomZ gm4_mu_data 8
execute at @s if score $randomZ gm4_mu_data matches 4.. run tp @s ~ ~ ~4
execute if score $randomZ gm4_mu_data matches 4.. run scoreboard players remove $randomZ gm4_mu_data 4
execute at @s if score $randomZ gm4_mu_data matches 2.. run tp @s ~ ~ ~2
execute if score $randomZ gm4_mu_data matches 2.. run scoreboard players remove $randomZ gm4_mu_data 2
execute at @s if score $randomZ gm4_mu_data matches 1.. run tp @s ~ ~ ~1
execute if score $randomZ gm4_mu_data matches 1.. run scoreboard players remove $randomZ gm4_mu_data 1

scoreboard players set $move_y_limit gm4_mu_data 12
execute at @s store result score $location_found gm4_mu_data run function gm4_monsters_unbound:mob/process/elite/volatile/pillar_location_y
execute if score $location_found gm4_mu_data matches 0 run return run kill @s

execute unless score $keep_tick.elite_pillar_volatile gm4_mu_keep_tick matches 1 run schedule function gm4_monsters_unbound:clocks/elite/volatile_pillar 1t
execute at @s run playsound minecraft:entity.ender_dragon.shoot hostile @a ~ ~ ~ 1 0.5
