# shoot lazer
# @s = pearlescent elite
# at @s
# run from mob/process/elite/pearlescent/process

playsound block.campfire.crackle hostile @a ~ ~ ~ 0.5 0.8
particle flash ~ ~1.8 ~

execute on target run tag @s[type=player] add gm4_mu_target
execute unless entity @p[tag=gm4_mu_target] run return 0
tag @s add gm4_mu_self

scoreboard players set $lazer_limit gm4_mu_data 50
execute anchored eyes facing entity @p[tag=gm4_mu_target] eyes positioned ^ ^ ^0.2 run function gm4_monsters_unbound:mob/process/elite/pearlescent/lazer_raycast

execute on target run tag @s remove gm4_mu_target
tag @s remove gm4_mu_self
