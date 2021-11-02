# sets up the marker used for spore entities
# @s = shroomite_shroom ready to spawn a spore if the global spore cap has not yet been reached
# at @s
# run from gm4_shroomites:spore/spawn

# place correct marker depending on spore color
execute store success score $success gm4_shroom_data if entity @s[tag=gm4_brown_shroomite] run summon marker ~ ~ ~ {Tags:["gm4_shroomite_spore","gm4_brown_shroomite"],CustomName:'"gm4_shroomite_spore"'}
execute unless score $success gm4_shroom_data matches 1.. run summon marker ~ ~ ~ {Tags:["gm4_shroomite_spore","gm4_red_shroomite"],CustomName:'"gm4_shroomite_spore"'}
scoreboard players reset $success gm4_shroom_data
