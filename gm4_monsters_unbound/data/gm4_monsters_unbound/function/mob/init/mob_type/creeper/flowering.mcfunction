# apply invisibility to creeper
# @s = creeper
# at @s
# run from mob/init/mob_type/creeper/base

tag @s add gm4_mu_cloaked_creeper
effect give @s invisibility 35 0
data modify entity @s ExplosionRadius set value 2s