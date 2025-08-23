# get y level of world surface (motion blocking no leaves)
# @s = marker
# at @s
# run from mob/init/calc_difficulty_overworld

execute store result score $world_surface gm4_sr_data run data get entity @s Pos[1]
kill @s 
