# sets nbt and scores on newly created zauber cauldron markers
# @s = newly created zauber cauldron
# at @s
# ran from cauldron/setup/create

# set nbt
data modify entity @s CustomName set value '"gm4_zauber_cauldron"'

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
scoreboard players set @s gm4_entity_version 1
