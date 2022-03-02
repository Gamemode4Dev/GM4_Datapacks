# run from main
# @s = slime/magma cube
# at @s

execute store result score $onground gm4_ce_data run data get entity @s wasOnGround
execute if score $onground gm4_ce_data matches 0 run tag @s add gm4_ce_poison_landing_ready
execute if score $onground gm4_ce_data matches 1 if entity @s[tag=gm4_ce_poison_landing_ready] run function gm4_combat_evolved:mobs/effects/poison_landing/land
