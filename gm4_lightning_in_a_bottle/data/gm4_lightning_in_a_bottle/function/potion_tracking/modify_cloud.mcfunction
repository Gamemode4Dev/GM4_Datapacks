# change the lingering bottle's cloud particle effects
# @s = aec with LiaB thrown lingering bottle effects
# at a nearby gm4_liab_potion_tracker marker
# run from potion_tracking/potion_landed

tag @s add gm4_liab_lingering
data merge entity @s {custom_particle:{type:"minecraft:electric_spark"},RadiusOnUse:0f,RadiusPerTick:0f}
