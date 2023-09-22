# check the amount of arrows to spawn
# @s = player wearing archer armor shooting a (cross)bow
# at unspecified
# run from tick

# check amount of archer pieces
scoreboard players set $storm_arrow_target gm4_ce_data 4
execute if predicate gm4_combat_expanded:modified_armor/archer/head run scoreboard players add $storm_arrow_target gm4_ce_data 4
execute if predicate gm4_combat_expanded:modified_armor/archer/chest run scoreboard players add $storm_arrow_target gm4_ce_data 4
execute if predicate gm4_combat_expanded:modified_armor/archer/legs run scoreboard players add $storm_arrow_target gm4_ce_data 4
execute if predicate gm4_combat_expanded:modified_armor/archer/feet run scoreboard players add $storm_arrow_target gm4_ce_data 4

# spawn arrows
execute anchored eyes positioned ^ ^ ^2 as @e[type=#gm4_combat_expanded:arrow,tag=!gm4_ce_archer_arrow,distance=..2.5,limit=1,sort=nearest] at @s run function gm4_combat_expanded:armor/modifier/type/archer/apply
# multishot support (spawns half as many arrows)
scoreboard players operation $storm_arrow_target gm4_ce_data /= #2 gm4_ce_data
execute anchored eyes positioned ^ ^ ^2 as @e[type=#gm4_combat_expanded:arrow,tag=!gm4_ce_archer_arrow,distance=..2.5,limit=2,sort=nearest] at @s run function gm4_combat_expanded:armor/modifier/type/archer/apply
