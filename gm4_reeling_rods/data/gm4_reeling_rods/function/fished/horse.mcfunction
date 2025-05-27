# Action for reeled horse
# @s = horse
# at bobber in @s
# run from fished/select_type

data modify storage gm4_reeling_rods:temp item_data set value {}
data modify storage gm4_reeling_rods:temp item_data.Item set from entity @s equipment.saddle
execute store result score $armored gm4_reeling_rods.math if items entity @s armor.body * run data modify storage gm4_reeling_rods:temp item_data.Item set from entity @s equipment.body
function gm4_reeling_rods:pull_items
execute if score $armored gm4_reeling_rods.math matches 0 run item replace entity @s saddle with minecraft:air
execute if score $armored gm4_reeling_rods.math matches 1 run item replace entity @s armor.body with minecraft:air
