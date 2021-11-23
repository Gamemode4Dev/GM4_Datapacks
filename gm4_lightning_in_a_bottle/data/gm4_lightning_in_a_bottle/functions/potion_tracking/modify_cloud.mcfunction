# change the lingering bottle's cloud particle effects
# @s = aec with LiaB thrown lingering bottle effects
# run from potion_tracking/potion_landed

tag @s add gm4_liab_lingering
data modify entity @s Particle set value "minecraft:electric_spark"
