# add charge this this coral flower (grow into spore blossom)
# @s = coral flower (block marker)
# at @s
# run from coral_vine/flower/charge

data modify entity @s block_state.Name set value "minecraft:spore_blossom"

execute if entity @s[tag=gm4_hy_coral_flower.north] run data modify entity @s transformation.translation[2] set value -1f
execute if entity @s[tag=gm4_hy_coral_flower.east] run data modify entity @s transformation.translation[0] set value 1f
execute if entity @s[tag=gm4_hy_coral_flower.south] run data modify entity @s transformation.translation[2] set value 1f
execute if entity @s[tag=gm4_hy_coral_flower.west] run data modify entity @s transformation.translation[0] set value -1f

tag @s add gm4_hy_coral_flower.charged
