# Action for reeled villager
# @s = villager
# at @s
# run from fished/select_type

# store mainhand data for a potential trade steal
data modify storage gm4_reeling_rods:temp entity_data set value {}
data modify storage gm4_reeling_rods:temp entity_data.mainhand set from entity @s HandItems[0]

# try to steal
execute store result score $slot gm4_reeling_rods.math run function gm4_reeling_rods:fished/stealable/steal_equipment
# if not mainhand, return
execute unless score $slot gm4_reeling_rods.math matches 1 run return fail

## mainhand stolen (TRADED ITEM)

# find trade and sell it out
function gm4_reeling_rods:fished/villager/sell_out with storage gm4_reeling_rods:temp entity_data

# adds 20 "major_negative" gossip of the player to the villager
data modify storage gm4_reeling_rods:temp entity_data.gossip.Target set from entity @a[tag=gm4_reeling_rods.player,limit=1,distance=..33] UUID
function gm4_reeling_rods:fished/villager/add_gossip with storage gm4_reeling_rods:temp entity_data.gossip

# angry particles
particle minecraft:angry_villager ~ ~1.5 ~ 0.3 0.3 0.3 20 3
# angry sound
playsound minecraft:entity.villager.hurt neutral @a[distance=..16] ~ ~1.5 ~
