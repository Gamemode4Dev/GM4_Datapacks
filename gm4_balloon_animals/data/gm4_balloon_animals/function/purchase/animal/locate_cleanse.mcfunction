# Delayed activation of cleansing newly purchased animals
# at world spawn
# scheduled by purchase/animal/update

execute as @e[type=#gm4_balloon_animals:balloon_animal,tag=gm4_balloon_animal_newly_purchased] run function gm4_balloon_animals:purchase/animal/cleanse
