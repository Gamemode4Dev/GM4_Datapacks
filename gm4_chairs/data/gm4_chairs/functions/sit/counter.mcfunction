# Timer for Couch Potato
# @s = player sitting in a chair
# at @s
# run from function sit/check

# increase time sitting in chair
scoreboard players add @s gm4_chairs_sit 1

# sit in a chair for 1 hour
execute if score @s gm4_chairs_sit matches 360.. run advancement grant @s only gm4:chairs_sit
