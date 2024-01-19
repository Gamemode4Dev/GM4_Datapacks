# Removes effects that protected and kept afloat the balloon animal
# @s = newly purchased balloon animal
# at world spawn
# run from gm4_balloon_animal:purchase/animal/locate_cleanse

# remove balloon effects
effect clear @s levitation
effect clear @s slow_falling
effect clear @s resistance

tag @s remove gm4_balloon_animal_newly_purchased

# temporary protection
effect give @s slow_falling 5
effect give @s resistance 5 4

# allow aging
data modify entity @s Age set value -12000
