# Steal Chested Horse chest and items inside
# @s = #gm4_reeling_rods:chested_horse or llama / trader llama
# at bobber in @s
# run from reeling/llama & reeling/chested_horse

# fail if not chested horse
execute unless data entity @s {ChestedHorse:1b} run return fail

# steal slot
data modify storage gm4_reeling_rods:temp item_data set value {}
data modify storage gm4_reeling_rods:temp item_data.Item set value {id:"minecraft:chest",count:1}
function gm4_reeling_rods:pull_items
data modify entity @s ChestedHorse set value 0b

playsound minecraft:entity.item.pickup neutral @a[distance=..16] ~ ~ ~
return 9
