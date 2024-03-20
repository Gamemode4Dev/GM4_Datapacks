# set data for this coral bud
# @s = coral bud (block marker)
# at @s
# run from coral_vine/grow/bud/initiate

function gm4_hydromancy:coral_vine/grow/bud/set_data
tag @s add gm4_hy_coral_flower.east
data merge entity @s {transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,1f,1f],translation:[0.6f,-0.25f,-0.25f],scale:[0.25f,0.25f,0.25f]},block_state:{Name:"minecraft:wither_rose"}}
execute store result entity @s transformation.translation[1] float -0.01 run scoreboard players get $var1 gm4_hy_data
execute store result entity @s transformation.translation[2] float -0.01 run scoreboard players get $var2 gm4_hy_data
