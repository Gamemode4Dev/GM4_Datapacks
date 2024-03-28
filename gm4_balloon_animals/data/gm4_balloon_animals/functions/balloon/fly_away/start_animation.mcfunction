# @s = orphaned animal, tag=gm4_balloon_animal,tag=gm4_balloon_animal_purchased
# run from balloon/check_leashed

scoreboard players set @s gm4_balloon_animals_data 0

tag @s add gm4_balloon_animal_fly_away

schedule function gm4_balloon_animals:balloon/fly_away/loop 16t
