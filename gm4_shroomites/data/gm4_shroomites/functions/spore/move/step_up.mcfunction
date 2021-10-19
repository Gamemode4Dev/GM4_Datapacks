# moves a shroomite_path up by 1 if necessary.
# @s = @e[type=marker,tag=gm4_shroomite_path]
# at @s
# run from gm4_shroomites:spore/move/horizontal

# check if there is space above
execute unless block ~ ~1 ~ #gm4:full_collision run tp @s ~ ~1 ~
execute if block ~ ~1 ~ #gm4:full_collision run kill @s
