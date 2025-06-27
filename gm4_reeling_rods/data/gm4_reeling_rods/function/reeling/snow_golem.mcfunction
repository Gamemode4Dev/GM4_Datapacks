# Action for reeled snow_golem
# @s = snow_golem
# at bobber in @s
# run from hooked_entity/select_type

# fail if no Pumpkin
execute unless data entity @s {Pumpkin:1b} run return fail

# steal
data modify storage gm4_reeling_rods:temp item_data set value {}
data modify entity @s Pumpkin set value 0b
data modify storage gm4_reeling_rods:temp item_data.Item set value {id:"minecraft:carved_pumpkin",count:1}
function gm4_reeling_rods:pull_items

playsound minecraft:entity.item.pickup neutral @a[distance=..16] ~ ~ ~
