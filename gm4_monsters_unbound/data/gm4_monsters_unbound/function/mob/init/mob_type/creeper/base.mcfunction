# calculate modifiers for newly spawned creeper
# @s = creeper
# at @s
# run from mob/init/mob_type

# | Biome Modifiers
# snowy
execute if entity @s[tag=!gm4_sr_extra_mob,predicate=gm4_monsters_unbound:biome/snowy] run function gm4_monsters_unbound:mob/init/mob_type/creeper/snowy
# mountainous
attribute @s[predicate=gm4_monsters_unbound:biome/mountainous] generic.knockback_resistance modifier add gm4_monsters_unbound:stat_change.mountainous 0.4 add_value
# burned
execute if predicate gm4_monsters_unbound:biome/burned store result entity @s Fuse int 0.75 run data get entity @s Fuse
# flowering 
execute if predicate gm4_monsters_unbound:biome/flowering run function gm4_monsters_unbound:mob/init/mob_type/creeper/flowering
# toxic
tag @s[predicate=gm4_monsters_unbound:biome/toxic] add gm4_mu_toxic_creeper
execute if entity @s[tag=gm4_mu_toxic_creeper] run function gm4_monsters_unbound:mob/process/toxic_creeper
# growth
attribute @s[predicate=gm4_monsters_unbound:biome/growth] generic.movement_speed modifier add gm4_monsters_unbound:stat_change.growth 0.2 add_multiplied_base
# dark
data modify entity @s[predicate=gm4_survival_refightalized:mob/underground] ExplosionRadius set value 4s
