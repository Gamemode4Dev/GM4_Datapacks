# checks the specific mob type
# @s = aging mob
# located at @s
# run from aging/multiple
# and from aging/single

tag @e remove gm4_es_new_mob

function #gm4_everstone:update_age

execute if entity @s[type=guardian] run function gm4_everstone:aging/update_age/guardian
execute if entity @s[type=piglin] run function gm4_everstone:aging/update_age/piglin
execute if entity @s[type=skeleton] run function gm4_everstone:aging/update_age/skeleton
execute if entity @s[type=slime] run function gm4_everstone:aging/update_age/slime
execute if entity @s[type=stray] run function gm4_everstone:aging/update_age/stray
execute if entity @s[type=vindicator] run function gm4_everstone:aging/update_age/vindicator
execute if entity @s[type=zombie] run function gm4_everstone:aging/update_age/zombie

tag @e remove gm4_es_new_mob
