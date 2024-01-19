# Delayed activation of cleansing newly purchased animals
# at world spawn
# scheduled run from gm4_balloon_animal:purchase/animal/update

execute as @e[tag=gm4_balloon_animal_newly_purchased] run function gm4_balloon_animals:purchase/animal/cleanse
