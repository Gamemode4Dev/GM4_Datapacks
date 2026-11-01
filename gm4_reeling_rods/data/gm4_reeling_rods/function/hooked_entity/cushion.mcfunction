# Action for hooked cushion
# @s = cushion
# at bobber in @s
# run from hooked_entity/select_type
# with $color: string color data from @s

$data modify storage gm4_reeling_rods:temp item_data.Item set value {id:"minecraft:$(color)_cushion",count:1}
function gm4_reeling_rods:pull_items

kill @s
playsound minecraft:entity.cushion.break neutral @a[distance=..16] ~ ~ ~
