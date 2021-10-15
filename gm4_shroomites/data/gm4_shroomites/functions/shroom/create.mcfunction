# places a new sporing shroom at the location this function is run at
# @s = unspecified
# at unspecified
# run from gm4_shroomites:spore/die

# place shroom
execute unless block ~ ~ ~ red_mushroom run setblock ~ ~ ~ red_mushroom destroy
execute if score $global_shroom_count gm4_shroom_data < #global_shroom_cap gm4_shroom_data align xyz run summon marker ~.5 ~.5 ~.5 {Tags:["gm4_shroomite_shroom"],CustomName:'"gm4_shroomite_shroom"'}

# add cooldown in case this was planted by a mooshroom
scoreboard players operation @s gm4_shroom_data += #shroom_placement_cooldown gm4_shroom_data

# particles and sounds
particle minecraft:block red_mushroom ~ ~ ~ 0.1 0.1 0.1 1 10
playsound minecraft:block.chorus_flower.grow hostile @a[distance=..8] ~ ~ ~ 0.2 0.8
