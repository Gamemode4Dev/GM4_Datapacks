# Action for reeled villager
# @s = villager
# at @s
# run from gm4_reeling_rods:fishing/villager/adv

# fail if baby
execute store result score $misc gm4_reeling_rods.math run data get entity @s Age
execute unless score $misc gm4_reeling_rods.math matches 0.. run return fail

# fail if not holding anything
execute unless data entity @s HandItems[0].id run return fail

# find trade and sell it out
data modify storage gm4_reeling_rods:temp entity_data set value {}
data modify storage gm4_reeling_rods:temp entity_data.mainhand set from entity @s HandItems[0]
function gm4_reeling_rods:fishing/villager/sell_out with storage gm4_reeling_rods:temp entity_data

# adds 20 "major_negative" gossip of the player to the villager
data modify storage gm4_reeling_rods:temp entity_data.gossip.Target set from entity @a[tag=gm4_reeling_rods.player,limit=1,distance=..33] UUID
function gm4_reeling_rods:fishing/villager/add_gossip with storage gm4_reeling_rods:temp entity_data.gossip

# angry particles
particle minecraft:angry_villager ~ ~1.5 ~ 0.3 0.3 0.3 20 3
# angry sound
playsound minecraft:entity.villager.hurt neutral @a[distance=..16] ~ ~1.5 ~

# pulls item
data modify storage gm4_reeling_rods:temp item_data.Item set from entity @s HandItems[0]
data modify entity @s HandItems[0] set value {}
execute positioned ~ ~1.1 ~ run function gm4_reeling_rods:separate
