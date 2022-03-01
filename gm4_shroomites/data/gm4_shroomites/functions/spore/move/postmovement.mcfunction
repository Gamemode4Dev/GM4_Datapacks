# applies environmental effects after the spore has moved
# @s = @e[type=marker,tag=gm4_shroomite_spore]
# at @s (after move)
# run from gm4_shroomites:spore/move/horizontal

# subtract from age and convert dirt below to mycelium
execute unless block ~ ~-1 ~ mycelium if block ~ ~-1 ~ #gm4_shroomites:spore_convertable run function gm4_shroomites:spore/fertilize

# subtract from age and convert neraby cows to mooshrooms
execute if entity @s[tag=gm4_brown_shroomite] as @e[type=cow,distance=..1,nbt=!{NoAI:1b}] at @s run function gm4_shroomites:mooshroom/convert/brown
execute if entity @s[tag=gm4_red_shroomite] as @e[type=cow,distance=..1,nbt=!{NoAI:1b}] at @s run function gm4_shroomites:mooshroom/convert/red

