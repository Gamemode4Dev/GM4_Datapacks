# Action for reeled bee
# @s = bee
# at bobber in @s
# run from hooked_entity/select_type

# fail if no nectar
execute unless data entity @s {HasNectar:1b} run return fail

# Steal
data modify storage gm4_reeling_rods:temp item_data set value {}
data modify entity @s HasNectar set value 0b
data modify entity @s angry_at set from entity @p[tag=gm4_reeling_rods.player] UUID
execute store result score $anger_end_time gm4_reeling_rods.math run time query gametime
scoreboard players add $anger_end_time gm4_reeling_rods.math 300
execute store result entity @s anger_end_time long 1 run scoreboard players get $anger_end_time gm4_reeling_rods.math
data modify storage gm4_reeling_rods:temp item_data.Item set value {id:"minecraft:honeycomb",count:1}
function gm4_reeling_rods:pull_items

playsound entity.bee.hurt neutral @a[distance=..16] ~ ~ ~
