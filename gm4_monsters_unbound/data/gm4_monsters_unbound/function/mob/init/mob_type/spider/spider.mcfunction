# calculate modifiers for newly spawned spider
# @s = spider
# at @s
# run from mob/init/mob_type

# | Biome Modifiers
# snowy
tag @s[predicate=gm4_monsters_unbound:biome/snowy] add gm4_mu_slowing_attack
# mountainous
effect give @s[predicate=gm4_monsters_unbound:biome/mountainous,predicate=gm4_monsters_unbound:chance/spider/speed] speed infinite 0
# burned
effect give @s[predicate=gm4_monsters_unbound:biome/burned,predicate=gm4_monsters_unbound:chance/spider/fire_resist] fire_resistance infinite 0
# flowering 
execute if predicate gm4_monsters_unbound:biome/lush_caves if predicate gm4_monsters_unbound:chance/spider/replace_with_silverfish run function gm4_monsters_unbound:mob/init/mob_type/spider/lush_caves
# toxic
execute if predicate gm4_monsters_unbound:biome/toxic run function gm4_monsters_unbound:mob/init/mob_type/spider/toxic
# growth
execute if entity @s[tag=!gm4_sr_extra_mob,predicate=gm4_monsters_unbound:biome/growth] store success score $mob_extras gm4_sr_data run summon spider ~ ~ ~ {Tags:["gm4_sr_extra_mob"]}
execute if entity @s[tag=!gm4_sr_extra_mob,predicate=gm4_monsters_unbound:biome/growth,predicate=gm4_monsters_unbound:chance/spider/extra_spawn] store success score $mob_extras gm4_sr_data run summon spider ~ ~ ~ {Tags:["gm4_sr_extra_mob"]}
# dark
effect give @s[predicate=gm4_survival_refightalized:mob/underground,predicate=gm4_monsters_unbound:chance/spider/invisibility] invisibility infinite 0
