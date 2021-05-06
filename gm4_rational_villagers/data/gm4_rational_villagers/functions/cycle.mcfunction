
# store first line of gossip and delete it
data modify storage gm4_rational_villagers:temp/villager Modify set from storage gm4_rational_villagers:temp/villager Gossips[0]
data remove storage gm4_rational_villagers:temp/villager Gossips[0]

# get current gossip value
execute store result score value gm4_rv_trade run data get storage gm4_rational_villagers:temp/villager Modify.Value

# modify current gossip
function gm4_rational_villagers:modify_gossip

# store modified gossip
data modify storage gm4_rational_villagers:temp/villager Store append from storage gm4_rational_villagers:temp/villager Modify

# loop until all gossip has been checked
execute if data storage gm4_rational_villagers:temp/villager Gossips[0].Type run function gm4_rational_villagers:cycle