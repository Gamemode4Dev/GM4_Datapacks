# sets nbt and scores on newly created zauber cauldron markers
# @s = newly created zauber cauldron
# at @s
# ran from cauldron/setup/create or from upgrade path 1.10

# set nbt
data modify entity @s CustomName set value '"gm4_zauber_cauldron"'

# store cauldron position and dimension in nbt, this is only done once upon creation
# store coordinates as integers, wormholes always teleport to the center of the target block
execute store result entity @s data.gm4_zauber_cauldrons.location.x int 1 run data get entity @s Pos[0]
execute store result entity @s data.gm4_zauber_cauldrons.location.y int 1 run data get entity @s Pos[1]
execute store result entity @s data.gm4_zauber_cauldrons.location.z int 1 run data get entity @s Pos[2]
data modify entity @s data.gm4_zauber_cauldrons.location.dimension set from entity @p Dimension

# TODO remove this when switching over to custom liquids only!
# instead, the liquid type should be pulled from the vanilla cauldron
# upon creation and the vanilla cauldron converted to custom liquid
data modify entity @s data.gm4_zauber_cauldrons.liquid set value {id:"none"}

# add tags
tag @s add gm4_zauber_cauldron
tag @s add smithed.entity
tag @s add smithed.strict
tag @s add smithed.block

# set scores
scoreboard players set @s gm4_entity_version 2
