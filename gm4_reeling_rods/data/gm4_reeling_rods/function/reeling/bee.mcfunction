# Action for reeled bee
# @s = bee
# at bobber in @s
# run from hooked_entity/select_type

# fail if no nectar
execute unless data entity @s {HasNectar:1b} run return fail

# Steal
data modify storage gm4_reeling_rods:temp item_data set value {}
data merge entity @s {HasNectar:0b,AngerTime:300}
data modify entity @s AngryAt set from entity @p[tag=gm4_reeling_rods.player] UUID
data modify storage gm4_reeling_rods:temp item_data.Item set value {id:"minecraft:honeycomb",count:1}
function gm4_reeling_rods:pull_items

playsound entity.bee.hurt neutral @a[distance=..16] ~ ~ ~
