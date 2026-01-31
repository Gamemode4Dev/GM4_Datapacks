# process particle
# @s = furniture particle marker
# at @s
# run from main

execute store result score $rand gm4_furniture_data run random value 1..10

execute if entity @s[tag=gm4_furniture.particle.smoke] if score $rand gm4_furniture_data matches 1..6 run particle smoke ~ ~.02 ~

execute if entity @s[tag=gm4_furniture.particle.flame] if score $rand gm4_furniture_data matches 2..10 run particle flame ~ ~ ~

execute if entity @s[tag=gm4_furniture.particle.campfire_smoke] if score $rand gm4_furniture_data matches 1..9 run particle smoke ~ ~.02 ~
