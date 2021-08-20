#@s = liquid tank with cauldron above it, at cauldron
#run from util_above

#init tank
execute if entity @s[tag=gm4_lt_empty] if block ~ ~ ~ minecraft:water_cauldron at @s run function gm4_standard_liquids:liquid_init/water
execute if entity @s[tag=gm4_lt_empty] if block ~ ~ ~ minecraft:lava_cauldron at @s run function gm4_standard_liquids:liquid_init/lava
execute if entity @s[tag=gm4_lt_empty] if block ~ ~ ~ minecraft:powder_snow_cauldron at @s run function gm4_standard_liquids:liquid_init/powder_snow

#water
execute if entity @s[tag=gm4_lt_water] if score @s gm4_lt_value matches ..299 run function gm4_standard_liquids:util/cauldrons/drain_water_cauldron

#powder_snow
execute if entity @s[tag=gm4_lt_powder_snow] if score @s gm4_lt_value matches ..299 run function gm4_standard_liquids:util/cauldrons/drain_powder_snow_cauldron

#lava
execute if entity @s[tag=gm4_lt_lava] if block ~ ~ ~ minecraft:lava_cauldron if score @s gm4_lt_value matches ..297 run function gm4_standard_liquids:util/cauldrons/drain_lava_cauldron
