# Removes effects that protected and kept afloat the balloon animal
# @s = newly purchased balloon animal, tag=gm4_balloon_animal_purchased,tag=gm4_balloon_animal_newly_purchased
# at world spawn
# run from purchase/animal/locate_cleanse

tag @s remove gm4_balloon_animal_newly_purchased

# remove balloon effects
effect clear @s levitation
effect clear @s slow_falling
effect clear @s resistance

# temporary protection
effect give @s slow_falling 5
effect give @s resistance 5 4

# allow aging
data modify entity @s Age set value -12000
