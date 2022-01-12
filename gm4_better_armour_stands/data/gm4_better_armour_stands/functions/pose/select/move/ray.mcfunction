# @s = armor_stand to be moved
# at @s
# run from functions in pose/select/move/

scoreboard players add @s gm4_bas_dist 5
execute positioned ~-.2 ~-.2 ~-.2 as @s[dx=0] positioned ~-.6 ~-.6 ~-.6 run tag @s[dx=0] add gm4_bas_stop_ray

# continue searching if not inside armor_stand
execute unless entity @s[tag=gm4_bas_stop_ray] unless score @s gm4_bas_dist matches 50.. positioned ^ ^ ^.5 run function gm4_better_armour_stands:pose/select/move/ray

# found armor_stand
execute as @s[tag=gm4_bas_stop_ray] run function gm4_better_armour_stands:pose/select/move/offset
