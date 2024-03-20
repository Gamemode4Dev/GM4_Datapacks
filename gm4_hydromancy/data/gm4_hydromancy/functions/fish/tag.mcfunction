# tag tropical fish near coral flowers (11x11x11 box centered around the block the fan is on)
# @s = tropical fish
# at coral flower positioned ~-5.5 ~-6.5 ~-5.5
# run from coral_core/process

tag @s add gm4_hy_tracked_fish
execute summon marker run function gm4_hydromancy:fish/pick_goal
scoreboard players operation @s gm4_hy_goal = $fish_goal gm4_hy_data

scoreboard players add @s gm4_hy_next_charge_change 0
execute if score @s gm4_hy_charge > @s gm4_hy_next_charge_change at @s run function gm4_hydromancy:fish/update_color
