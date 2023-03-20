# add charge this this coral bud (grow into spore blossom)
# @s = coral bud (block marker)
# at @s
# run from coral_vine/bud/charge

execute store result entity @s transformation.translation[1] float -1 run data get entity @s transformation.translation[1]
execute if entity @s[tag=gm4_hy_coral_bud.north] run function gm4_hydromancy:coral_vine/bud/charge_north
execute if entity @s[tag=gm4_hy_coral_bud.east] run function gm4_hydromancy:coral_vine/bud/charge_east
execute if entity @s[tag=gm4_hy_coral_bud.south] run function gm4_hydromancy:coral_vine/bud/charge_south
execute if entity @s[tag=gm4_hy_coral_bud.west] run function gm4_hydromancy:coral_vine/bud/charge_west
tag @s add gm4_hy_coral_bud.charged
