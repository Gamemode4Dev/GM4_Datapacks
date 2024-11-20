# runs validates that this spore has not died already
# @s = @e[type=marker,tag=gm4_shroomite_spore]
# at @s
# run from gm4_shroomites:main

# kill spores that are inside a non-traversable block
execute if block ~ ~ ~ #gm4_shroomites:spore_opaque run kill @s

# manage age and process actions on spore if age doesn't exceed #spore_max_age
scoreboard players add @s gm4_shroom_data 1
execute if score @s gm4_shroom_data > #spore_max_age gm4_shroom_data run function gm4_shroomites:spore/die
execute unless score @s gm4_shroom_data > #spore_max_age gm4_shroom_data run function gm4_shroomites:spore/process
