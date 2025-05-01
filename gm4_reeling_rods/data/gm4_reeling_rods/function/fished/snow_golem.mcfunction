# Action for reeled snow_golem
# @s = snow_golem
# at @s
# run from fished/select_type

# fail if no Pumpkin
execute unless data entity @s {Pumpkin:1b} run return fail

data modify entity @s Pumpkin set value 0b
data modify storage gm4_reeling_rods:temp item_data.Item set value {id:"minecraft:carved_pumpkin",count:1}
execute positioned ~ ~1.2 ~ run function gm4_reeling_rods:separate
