# change the lingering bottle's cloud particle effects
# @s = aec with LiaB thrown lingering bottle effects
# run from potion_tracking/potion_landed

tag @s add gm4_liab_lingering
data merge entity @s {Particle:"minecraft:electric_spark",RadiusOnUse:0f}
