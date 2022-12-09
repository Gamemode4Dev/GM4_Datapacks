# display a ring of heart particles on heal pulse activation
# @s = soothe pulse marker
# at @s
# run from armor/modifier/type/soothe/activate

scoreboard players add @s gm4_ce_data 1
particle heart ^ ^ ^-1.25 0 0 0 0 1
particle heart ^ ^ ^-2 0.05 0.05 0.05 0 1
particle heart ^ ^ ^-2.75 0.15 0.15 0.15 0 1
execute if score $level gm4_ce_data matches 2.. run particle heart ^ ^ ^-4.5 0.3 0.3 0.3 0 1
execute if score $level gm4_ce_data matches 3 run particle heart ^ ^ ^-6.25 0.5 0.5 0.5 0 1
tp @s ~ ~ ~ ~15 ~

kill @s[scores={gm4_ce_data=24..}]
execute if score @s gm4_ce_data matches ..23 at @s run function gm4_combat_expanded:armor/modifier/type/soothe/particles
