# turns a block below this spore into mycelium and uses up some of the age of this spore
# @s = @e[type=marker,tag=gm4_shroomite_spore]
# at @s
# run from gm4_shroomites:spore/move/postmovement

# place mycelium
setblock ~ ~-1 ~ mycelium replace
execute if block ~ ~ ~ #gm4:foliage unless block ~ ~ ~ #gm4_shroomites:mushrooms run setblock ~ ~ ~ air destroy

# add to age
scoreboard players operation @s gm4_shroom_data += #fertilization_cost gm4_shroom_data

# particles and sounds
particle minecraft:block mycelium ~ ~ ~ 0.12 0 0.12 1 2
playsound minecraft:block.chorus_flower.grow hostile @a[distance=..16] ~ ~ ~ 0.1 0
