# uses carrot from the players inventory and plants it
# @s = player requesting carrot planting
# at item planting location
# run from gm4_pig_tractors:plant/use_mainhand_seeds and gm4_pig_tractors:plant/use_offhand_seeds and gm4_pig_tractors:plant/use_predefined_order and gm4_pig_tractors:harvest/block/
# sets fake player flag $planted_successfully in gm4_pig_tractors to 1 if planting was successful, to 0 otherwise

# remove seed from player
execute if entity @s[gamemode=!creative] run clear @s minecraft:carrot 1

# place block
setblock ~ ~ ~ minecraft:carrots destroy

# sound
playsound minecraft:block.grass.place block @a[distance=..9] ~ ~ ~ 0.6 0.6
