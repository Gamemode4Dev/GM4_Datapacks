# runs actions on and as sporing shrooms
# @s = @e[type=marker,tag=gm4_shroomite_shroom]
# at @s
# run from gm4_shroomites:shroom/check_structure

# count total shrooms
scoreboard players add $global_shroom_count gm4_shroom_data 1

# chance to spawn spore unless this shroom is on cooldown from previous spawn
execute unless score @s gm4_shroom_data matches 1.. if predicate gm4_shroomites:shroom/spore_spawn_chance run function gm4_shroomites:spore/spawn
execute if score @s gm4_shroom_data matches 1.. run scoreboard players remove @s gm4_shroom_data 1
