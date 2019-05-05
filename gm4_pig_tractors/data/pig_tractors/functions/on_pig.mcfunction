# @s = player on a pig
# at @s
# Called from pulse_check
function pig_tractors:check_hoe
execute if entity @s[tag=gm4_has_hoe] run function pig_tractors:has_hoe 
tag @s remove gm4_has_hoe
