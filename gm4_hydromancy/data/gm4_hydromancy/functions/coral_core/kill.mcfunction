# kill coral flower if it is destroyed, release heart of the sea
# @s = coral flower
# at @s
# run from coral_core/submain

data modify storage gm4_hydromancy:temp item set from entity @s item
execute summon item run data modify entity @s Item set from storage gm4_hydromancy:temp item
data remove storage gm4_hydromancy:temp item
kill @s
execute positioned ~-7.5 ~-1.5 ~-7.5 run function gm4_hydromancy:coral_vine/check_connection
