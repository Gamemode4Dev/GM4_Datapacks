# calculate modifiers for newly spawned slime / magma cube
# @s = slime / magma cube
# at @s
# run from mob/init/mob_type

# | Biome Modifiers
# snowy
execute if score $size gm4_sr_data matches 1..2 if predicate gm4_monsters_unbound:biome/snowy run scoreboard players add $size gm4_sr_data 1
# flowering 
execute if predicate gm4_monsters_unbound:biome/flowering run function gm4_monsters_unbound:mob/init/mob_type/slime/flowering
# toxic
tag @s[type=slime,predicate=gm4_monsters_unbound:biome/toxic] add gm4_mu_poison_attack
# growth
execute if score $size gm4_sr_data matches 1.. if entity @s[type=slime,tag=!gm4_mu_extra_mob,predicate=gm4_monsters_unbound:biome/growth] run function gm4_monsters_unbound:mob/init/mob_type/slime/growth
# basalt deltas
execute if score $size gm4_sr_data matches 1..2 if entity @s[type=magma_cube,predicate=gm4_monsters_unbound:biome/nether/basalt_deltas] run scoreboard players add $size gm4_sr_data 1
attribute @s generic.attack_damage modifier add gm4_monsters_unbound:stat_change.basalt_deltas 0.15 add_multiplied_total
