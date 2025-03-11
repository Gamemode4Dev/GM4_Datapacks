# Action for reeled witch
# @s = witch
# at @s
# run from gm4_reeling_rods:fishing/witch/adv

# return if no item in mainhand
execute unless data entity @s HandItems[0].id run return fail

execute if score @s gm4_reeling_rods.entities matches 2 run return run function gm4_reeling_rods:fishing/witch/limit
scoreboard players add @s gm4_reeling_rods.entities 1

data modify storage gm4_reeling_rods:temp item_data.Item set from entity @s HandItems[0]
data modify entity @s HandItems[0] set value {}
execute positioned ~ ~1.2 ~ run function gm4_reeling_rods:separate
