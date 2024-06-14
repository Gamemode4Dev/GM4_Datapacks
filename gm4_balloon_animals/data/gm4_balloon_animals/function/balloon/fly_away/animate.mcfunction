# @s = orphaned animal, tag=gm4_balloon_animal,tag=gm4_balloon_animal_purchased
# run from balloon/fly_away/loop

scoreboard players add @s gm4_balloon_animals_data 1

effect give @s[scores={gm4_balloon_animals_data=1}] levitation infinite 3
effect give @s[scores={gm4_balloon_animals_data=2}] levitation infinite 7
effect give @s[scores={gm4_balloon_animals_data=3}] levitation infinite 15
effect give @s[scores={gm4_balloon_animals_data=4..}] levitation infinite 31

execute if entity @s[scores={gm4_balloon_animals_data=4..}] at @s run function gm4_balloon_animals:balloon/kill_orphan
