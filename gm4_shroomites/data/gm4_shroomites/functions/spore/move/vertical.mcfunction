# moves a spore one step
# @s = @e[type=marker,tag=gm4_shroomite_spore]
# at @s
# run from gm4_shroomites:spore/process

# move down if spore is above a block without collision, move horizontally otherwise
execute unless block ~ ~-1 ~ #gm4:full_collision if predicate gm4_shroomites:spore/descent_chance store success score $success gm4_shroom_data run tp @s ~ ~-1 ~
execute unless score $success gm4_shroom_data matches 1.. run function gm4_shroomites:spore/move/horizontal
scoreboard players reset $success gm4_shroom_data
