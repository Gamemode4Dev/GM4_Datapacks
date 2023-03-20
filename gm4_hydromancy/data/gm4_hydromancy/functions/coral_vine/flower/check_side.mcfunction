# add charge this this coral flower (grow into spore blossom)
# @s = coral flower (block marker)
# at @s
# run from coral_vine/flower/charge

execute store result entity @s transformation.translation[1] float -0.1 run data get entity @s transformation.translation[1] 10
execute if entity @s[tag=gm4_hy_coral_flower.north] run function gm4_hydromancy:coral_vine/flower/charge_north
execute if entity @s[tag=gm4_hy_coral_flower.east] run function gm4_hydromancy:coral_vine/flower/charge_east
execute if entity @s[tag=gm4_hy_coral_flower.south] run function gm4_hydromancy:coral_vine/flower/charge_south
execute if entity @s[tag=gm4_hy_coral_flower.west] run function gm4_hydromancy:coral_vine/flower/charge_west
tag @s add gm4_hy_coral_flower.charged
