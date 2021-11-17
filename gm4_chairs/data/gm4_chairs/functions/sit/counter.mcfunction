# Timer for Couch Potato
# @s = player sitting in a chair
# at @s
# run from function sit/check

# increase time sitting in chair
scoreboard players add @s gm4_chairs_sit 10

# sit in a chair for 1 hour
advancement grant @s[scores={gm4_chairs_sit=3600..3609}] only gm4:chairs_sit
