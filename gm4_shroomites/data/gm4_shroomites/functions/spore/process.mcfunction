# runs actions on and as spores
# @s = @e[type=marker,tag=gm4_shroomite_spore]
# at @s
# run from gm4_shroomites:spore/track_age

# count total spores
scoreboard players add $global_spore_count gm4_shroom_data 1

# move
execute if predicate gm4_shroomites:spore/move_chance run function gm4_shroomites:spore/move/vertical

# particles and sounds
particle minecraft:mycelium ~ ~ ~ 0.22 0.1 0.22 1 16
