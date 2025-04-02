# apply freeze from Chill slow
# @s = entity with 7 stacks of Chill
# at @s
# run from mob/process/attack_effect/slowing_attack

effect clear @s slowness
execute unless score $freeze_seconds gm4_mu_data matches 1.. run scoreboard players set $freeze_seconds gm4_mu_data 3
function gm4_monsters_unbound:effect/freeze/apply
