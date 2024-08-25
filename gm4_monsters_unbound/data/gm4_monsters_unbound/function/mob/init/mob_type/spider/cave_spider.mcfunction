# calculate modifiers for newly spawned cave spider
# @s = cave spider
# at @s
# run from mob/init/mob_type

# | Biome Modifiers
# mountainous
effect give @s[predicate=gm4_monsters_unbound:biome/mountainous,predicate=gm4_monsters_unbound:chance/spider/speed] speed infinite 0
# burned
effect give @s[predicate=gm4_monsters_unbound:biome/burned,predicate=gm4_monsters_unbound:chance/spider/fire_resist] fire_resistance infinite 0
# toxic
tag @s[predicate=gm4_monsters_unbound:biome/toxic] add gm4_mu_toxic_attack
# growth
execute if entity @s[tag=!gm4_sr_extra_mob,predicate=gm4_monsters_unbound:biome/growth] store success score $mob_extras gm4_sr_data run summon cave_spider ~ ~ ~ {Tags:["gm4_sr_extra_mob"]}
execute if entity @s[tag=!gm4_sr_extra_mob,predicate=gm4_monsters_unbound:biome/growth,predicate=gm4_monsters_unbound:chance/spider/extra_spawn] store success score $mob_extras gm4_sr_data run summon cave_spider ~ ~ ~ {Tags:["gm4_sr_extra_mob"]}
# dark
attribute @s[predicate=gm4_survival_refightalized:mob/underground] generic.movement_speed modifier add gm4_monsters_unbound:stat_change.dark 0.15 add_multiplied_base
