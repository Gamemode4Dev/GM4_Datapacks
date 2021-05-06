
# set storage
data modify storage gm4_rational_villagers:temp/villager NBT set from entity @s
data modify storage gm4_rational_villagers:temp/villager Gossips set from storage gm4_rational_villagers:temp/villager NBT.Gossips
data modify storage gm4_rational_villagers:temp/villager Profession set from storage gm4_rational_villagers:temp/villager NBT.VillagerData.profession
data modify storage gm4_rational_villagers:temp/villager Store set value []

# cycle through storage
function gm4_rational_villagers:cycle

# update nbt to match storage
data modify entity @s Gossips set from storage gm4_rational_villagers:temp/villager Store 
