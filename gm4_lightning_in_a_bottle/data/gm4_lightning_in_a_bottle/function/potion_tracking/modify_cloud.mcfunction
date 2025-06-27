# change the lingering bottle's cloud particle effects
# @s = aec with LiaB thrown lingering bottle effects
# run from potion_tracking/verify_landed_potion

tag @s add gm4_liab_lingering
data merge entity @s {custom_particle:{type:"minecraft:electric_spark"},RadiusOnUse:0f,RadiusPerTick:0f}
