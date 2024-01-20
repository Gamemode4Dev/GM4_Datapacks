
scoreboard objectives add gm4_balloon_animals_data dummy
scoreboard objectives add gm4_balloon_animals_id dummy 
scoreboard players set #8 gm4_balloon_animals_data 8
scoreboard players set #10 gm4_balloon_animals_data 10

execute unless score balloon_animals gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Balloon Animals"}
execute unless score balloon_animals gm4_earliest_version < balloon_animals gm4_modules run scoreboard players operation balloon_animals gm4_earliest_version = balloon_animals gm4_modules
scoreboard players set balloon_animals gm4_modules 1

schedule function gm4_balloon_animals:main 1t
