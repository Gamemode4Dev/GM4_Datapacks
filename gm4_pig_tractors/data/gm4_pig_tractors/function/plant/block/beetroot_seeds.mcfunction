# uses beetroot from the players inventory and plants it
# @s = player requesting beetroot planting
# at item planting location
# run from gm4_pig_tractors:plant/use_mainhand_seeds and gm4_pig_tractors:plant/use_offhand_seeds and gm4_pig_tractors:plant/use_predefined_order and gm4_pig_tractors:harvest/block/

# remove seed from player
execute if entity @s[gamemode=!creative] run clear @s minecraft:beetroot_seeds 1

# place block
setblock ~ ~ ~ minecraft:beetroots destroy

# sound
playsound minecraft:block.grass.place block @a[distance=..9] ~ ~ ~ 0.6 0.6
