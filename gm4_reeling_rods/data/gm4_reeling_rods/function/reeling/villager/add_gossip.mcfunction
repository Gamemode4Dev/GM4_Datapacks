# adds a "major_negaive" gossip of the player to the villager
# @s = villager
# at bobber in @s
# with {Target}
# run from reeling/villager/action

$execute store success score $success gm4_reeling_rods.math run \
  data modify storage gm4_reeling_rods:temp entity_data.gossip merge from entity @s Gossips[{Type:"major_negative",Target:$(Target)}]

execute unless score $success gm4_reeling_rods.math matches 1 run data modify storage gm4_reeling_rods:temp entity_data.gossip merge value {Type:"major_negative",Value:0}

execute store result score $gossip_value gm4_reeling_rods.math run data get storage gm4_reeling_rods:temp entity_data.gossip.Value
execute unless score $gossip_value gm4_reeling_rods.math matches ..80 run scoreboard players set $gossip_value gm4_reeling_rods.math 100
execute if score $gossip_value gm4_reeling_rods.math matches ..80 run scoreboard players add $gossip_value gm4_reeling_rods.math 20
execute store result storage gm4_reeling_rods:temp entity_data.gossip.Value int 1 run scoreboard players get $gossip_value gm4_reeling_rods.math
data modify entity @s Gossips append from storage gm4_reeling_rods:temp entity_data.gossip
