# Kills unpurchased balloon animals that are no longer attached 
# @s = orphaned animal, tag=gm4_balloon_animal,tag=!gm4_balloon_animal_purchased
# at @s
# run from gm4_balloon_animal:balloon/fly_away/animate

scoreboard players operation $orphan_id gm4_balloon_animals_data = @s gm4_balloon_animals_data

particle poof ~ ~ ~ 0 0 0 0.1 10
tp @s ~ ~-1000 ~
effect give @s invisibility 1 0 true
kill @s

# notify nearby traders?