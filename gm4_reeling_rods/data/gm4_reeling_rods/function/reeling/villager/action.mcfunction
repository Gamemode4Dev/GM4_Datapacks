# Action for reeled villager
# @s = villager
# at bobber in @s
# run from hooked_entity/select_type

# store mainhand data for a potential trade steal
data modify storage gm4_reeling_rods:temp entity_data set value {}
data modify storage gm4_reeling_rods:temp entity_data.mainhand set from entity @s equipment.mainhand

# try to steal
execute store result score $slot gm4_reeling_rods.math run function gm4_reeling_rods:reeling/stealable/steal_equipment
# if not mainhand, return
execute unless score $slot gm4_reeling_rods.math matches 1 run return fail

## mainhand stolen (TRADED ITEM)

# find trade and sell it out
function gm4_reeling_rods:reeling/villager/sell_out with storage gm4_reeling_rods:temp entity_data

# add 20 "major_negative" gossip of the player to the villager
data modify storage gm4_reeling_rods:temp entity_data.gossip.Target set from entity @p[tag=gm4_reeling_rods.player] UUID
function gm4_reeling_rods:reeling/villager/add_gossip with storage gm4_reeling_rods:temp entity_data.gossip

# feedback
particle minecraft:angry_villager ~ ~ ~ 0.3 0.3 0.3 20 3
playsound minecraft:entity.villager.hurt neutral @a[distance=..16] ~ ~ ~
