# Correctly found trader llama to be killed
# @s = a llama within 5 blocks of the wandering trader being checked
# at @s
# from gm4_balloon_animals:llama/check_leasher

execute on leasher at @s unless entity @e[type=marker,tag=gm4_balloon_animal_item_cleanup,distance=..0.01,limit=1] summon marker run tag @s add gm4_balloon_animal_item_cleanup

scoreboard players add $llamas_replaced gm4_balloon_animals_data 1

tp @s ~ ~-1000 ~
kill @s

schedule function gm4_balloon_animals:delay/item_cleanup 1t
