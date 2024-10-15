# calculate modifiers for newly spawned spider
# @s = spider
# at @s
# run from mob/init/mob_type

# | Biome Modifiers
# snowy
execute if predicate {condition:"minecraft:all_of",terms:[{condition:"minecraft:random_chance",chance:0.15},{condition:"minecraft:reference",name:"gm4_monsters_unbound:biome/snowy"}]} run function gm4_monsters_unbound:mob/init/mob_type/spider/snowy
# mountainous
execute if predicate {condition:"minecraft:all_of",terms:[{condition:"minecraft:random_chance",chance:0.40},{condition:"minecraft:reference",name:"gm4_monsters_unbound:biome/mountainous"}]} run effect give @s speed infinite 0
# burned
execute if predicate {condition:"minecraft:all_of",terms:[{condition:"minecraft:random_chance",chance:0.50},{condition:"minecraft:reference",name:"gm4_monsters_unbound:biome/burned"}]} run effect give @s fire_resistance infinite 0
# flowering 
execute if biome ~ ~ ~ lush_caves if predicate {condition:"minecraft:random_chance",chance:0.50} run function gm4_monsters_unbound:mob/init/mob_type/spider/lush_caves
# toxic
execute if entity @s[tag=!gm4_sr_extra_mob,predicate=gm4_monsters_unbound:biome/toxic] run function gm4_monsters_unbound:mob/init/mob_type/spider/toxic
# growth
execute if entity @s[tag=!gm4_sr_extra_mob,predicate=gm4_monsters_unbound:biome/growth] store success score $mob_extras gm4_sr_data run summon spider ~ ~ ~ {Tags:["gm4_sr_extra_mob"]}
execute if entity @s[tag=!gm4_sr_extra_mob,predicate=gm4_monsters_unbound:biome/growth] if predicate {condition:"minecraft:random_chance",chance:0.60} store success score $mob_extras gm4_sr_data run summon spider ~ ~ ~ {Tags:["gm4_sr_extra_mob"]}

# underground
execute if predicate {condition:"minecraft:all_of",terms:[{condition:"minecraft:random_chance",chance:0.25},{condition:"minecraft:reference",name:"gm4_survival_refightalized:mob/underground"}]} run function gm4_monsters_unbound:mob/init/mob_type/spider/underground/pick
