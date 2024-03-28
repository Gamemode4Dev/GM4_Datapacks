# @s = a llama within 5 blocks of the wandering trader being checked
# at @s
# run from wandering_trader/llama/check_leasher

execute on leasher at @s unless entity @e[type=marker,tag=gm4_balloon_animal_item_cleanup,distance=..0.01,limit=1] summon marker run tag @s add gm4_balloon_animal_item_cleanup

scoreboard players add $llamas_replaced gm4_balloon_animals_data 1

tp @s ~ ~-4096 ~
kill @s

schedule function gm4_balloon_animals:wandering_trader/llama/delay/lead_cleanup 1t
