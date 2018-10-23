#run from seasons:general/clock_second


execute if score gm4_szn_detect gm4_szn_season matches 1 run advancement grant @a only seasons:display/show_spring
execute if score gm4_szn_detect gm4_szn_season matches 1 run advancement grant @a only gm4:seasons_spring
execute if score gm4_szn_detect gm4_szn_season matches 1 run advancement revoke @a only seasons:display/show_winter
execute if score gm4_szn_detect gm4_szn_season matches 1 run advancement revoke @a only seasons:display/show_summer
execute if score gm4_szn_detect gm4_szn_season matches 1 run advancement revoke @a only seasons:display/show_autumn

execute if score gm4_szn_detect gm4_szn_season matches 2 run advancement grant @a only seasons:display/show_summer
execute if score gm4_szn_detect gm4_szn_season matches 2 run advancement grant @a only gm4:seasons_summer
execute if score gm4_szn_detect gm4_szn_season matches 2 run advancement revoke @a only seasons:display/show_winter
execute if score gm4_szn_detect gm4_szn_season matches 2 run advancement revoke @a only seasons:display/show_spring
execute if score gm4_szn_detect gm4_szn_season matches 2 run advancement revoke @a only seasons:display/show_autumn

execute if score gm4_szn_detect gm4_szn_season matches 3 run advancement grant @a only seasons:display/show_autumn
execute if score gm4_szn_detect gm4_szn_season matches 3 run advancement grant @a only gm4:seasons_autumn
execute if score gm4_szn_detect gm4_szn_season matches 3 run advancement revoke @a only seasons:display/show_winter
execute if score gm4_szn_detect gm4_szn_season matches 3 run advancement revoke @a only seasons:display/show_spring
execute if score gm4_szn_detect gm4_szn_season matches 3 run advancement revoke @a only seasons:display/show_summer

execute if score gm4_szn_detect gm4_szn_season matches 4 run advancement grant @a only seasons:display/show_winter
execute if score gm4_szn_detect gm4_szn_season matches 4 run advancement grant @a only gm4:seasons_winter
execute if score gm4_szn_detect gm4_szn_season matches 4 run advancement revoke @a only seasons:display/show_spring
execute if score gm4_szn_detect gm4_szn_season matches 4 run advancement revoke @a only seasons:display/show_summer
execute if score gm4_szn_detect gm4_szn_season matches 4 run advancement revoke @a only seasons:display/show_autumn


execute if score gm4_szn_detect gm4_szn_season matches 1 if entity @a[scores={gm4_szn_effect=-1000..}] run scoreboard players set @a[scores={gm4_szn_effect=-1000..}] gm4_szn_effect 0
execute if score gm4_szn_detect gm4_szn_season matches 3 if entity @a[scores={gm4_szn_effect=-1000..}] run scoreboard players set @a[scores={gm4_szn_effect=-1000..}] gm4_szn_effect 0



execute if entity @e[tag=gm4_szn_husk] as @e[tag=gm4_szn_husk] at @s if entity @a[distance=..6] run advancement grant @a[distance=..6] only summer_zombo
execute if entity @e[tag=gm4_szn_stick] as @e[tag=gm4_szn_stick] at @s if entity @a[distance=..6] run advancement grant @a[distance=..6] only no_leaves
execute if entity @e[tag=gm4_szn_turkey] as @e[tag=gm4_szn_turkey] at @s if entity @a[distance=..6] run advancement grant @a[distance=..6] only find_turkey
execute if entity @e[tag=gm4_szn_husk] as @e[tag=gm4_szn_husk] at @s if entity @a[distance=..6] run advancement grant @a[distance=..6] only summer_zombo
execute if entity @e[tag=gm4_szn_leaf] as @e[tag=gm4_szn_leaf] at @s if entity @a[distance=..6] run advancement grant @a[distance=..6] only leaf_pile
execute if entity @e[tag=gm4_szn_offspring] as @e[tag=gm4_szn_offspring] at @s if entity @a[distance=..6] run advancement grant @a[distance=..6] only spring_breed