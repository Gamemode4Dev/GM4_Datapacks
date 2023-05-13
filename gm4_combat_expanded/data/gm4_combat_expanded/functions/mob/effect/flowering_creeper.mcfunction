# apply invisibility to creeper
# @s = creeper
# at @s
# run from mob/mob_type/creeper

tag @s add gm4_ce_cloaked_creeper
effect give @s invisibility 35 0
data modify entity @s ExplosionRadius set value 2
