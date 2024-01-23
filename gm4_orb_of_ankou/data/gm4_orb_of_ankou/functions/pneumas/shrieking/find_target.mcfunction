# @s = sonic_boomer marker
# run from tick

particle minecraft:sonic_boom ~ ~ ~ 0 0 0 1 1
execute positioned ~-0.5 ~-0.5 ~-0.5 as @e[team=!gm4_invalid_team,tag=!gm4_oa_shrieker,dx=0.5,dy=0.5,dz=0.5] store success score $target_found gm4_pneuma_data run function gm4_orb_of_ankou:pneumas/shrieking/boom
scoreboard players add $ray gm4_pneuma_data 1

execute unless score $ray gm4_pneuma_data matches 15.. unless score $target_found gm4_pneuma_data matches 1.. positioned ^ ^ ^1 run function gm4_orb_of_ankou:pneumas/shrieking/find_target
