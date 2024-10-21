# calculate modifiers for newly spawned cave spider
# @s = cave spider
# at @s
# run from mob/init/mob_type

# | Biome Modifiers
# mountainous
execute if predicate {condition:"minecraft:all_of",terms:[{condition:"minecraft:random_chance",chance:0.40},{condition:"minecraft:reference",name:"gm4_monsters_unbound:biome/mountainous"}]} run effect give @s speed infinite 0
# burned
execute if predicate {condition:"minecraft:all_of",terms:[{condition:"minecraft:random_chance",chance:0.50},{condition:"minecraft:reference",name:"gm4_monsters_unbound:biome/burned"}]} run effect give @s fire_resistance infinite 0
# toxic
tag @s[predicate=gm4_monsters_unbound:biome/toxic] add gm4_mu_toxic_attack
# growth
execute if entity @s[tag=!gm4_sr_extra_mob,predicate=gm4_monsters_unbound:biome/growth] store success score $mob_extras gm4_sr_data run summon cave_spider ~ ~ ~ {Tags:["gm4_sr_extra_mob"]}
execute if entity @s[tag=!gm4_sr_extra_mob,predicate=gm4_monsters_unbound:biome/growth] if predicate {condition:"minecraft:random_chance",chance:0.60} store success score $mob_extras gm4_sr_data run summon cave_spider ~ ~ ~ {Tags:["gm4_sr_extra_mob"]}
# dripstone caves
execute if biome ~ ~ ~ dripstone_caves run attribute @s generic.max_health modifier add gm4_monsters_unbound:stat_change.dripstone_caves 1 add_multiplied_total
