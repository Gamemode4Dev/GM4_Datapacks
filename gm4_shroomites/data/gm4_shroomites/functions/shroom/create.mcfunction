# places a new sporing shroom at the location this function is run at
# @s = either a spore at the end of its life or a mooshroom
# at @s
# run from gm4_shroomites:spore/die and gm4_shroomites:mooshroom/process

# place shroom depending on which mooshroom or spore flavor placed this shroom, default to red
execute if entity @s[tag=gm4_brown_shroomite] run function gm4_shroomites:shroom/place/brown
execute unless score $success gm4_shroom_data matches 1.. run function gm4_shroomites:shroom/place/red
scoreboard players reset $success gm4_shroom_data

# add cooldown in case this was planted by a mooshroom
scoreboard players operation @s gm4_shroom_data += #shroom_placement_cooldown gm4_shroom_data

# sounds
playsound minecraft:block.chorus_flower.grow hostile @a[distance=..8] ~ ~ ~ 0.2 0.8
