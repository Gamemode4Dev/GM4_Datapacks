# calculate modifiers for newly spawned enderman
# @s = enderman
# at @s
# run from mob/init/mob_type

# | Biome Modifiers
# flowering 
execute if predicate gm4_monsters_unbound:biome/flowering if predicate {condition:"minecraft:random_chance",chance:0.50} run function gm4_monsters_unbound:mob/init/mob_type/enderman/flowering
# toxic 
execute if predicate gm4_monsters_unbound:biome/toxic if predicate {condition:"minecraft:random_chance",chance:0.50} run function gm4_monsters_unbound:mob/init/mob_type/enderman/toxic
# burned
execute if entity @s[tag=!gm4_sr_extra_mob,predicate=gm4_monsters_unbound:biome/burned] store success score $mob_extras gm4_sr_data run summon enderman ~.05 ~ ~ {Tags:["gm4_sr_extra_mob"]}
execute if entity @s[tag=!gm4_sr_extra_mob,predicate=gm4_monsters_unbound:biome/burned] store success score $mob_extras gm4_sr_data run summon enderman ~-.05 ~ ~.05 {Tags:["gm4_sr_extra_mob"]}
# growth 
execute if predicate gm4_monsters_unbound:biome/growth run function gm4_monsters_unbound:mob/init/mob_type/enderman/growth
# the end
execute if dimension the_end run attribute @s attack_damage modifier add gm4_monsters_unbound:stat_change.the_end 0.2 add_multiplied_base
execute if dimension the_end run attribute @s movement_speed modifier add gm4_monsters_unbound:stat_change.the_end 0.15 add_multiplied_base
# nether wastes
execute if biome ~ ~ ~ nether_wastes if predicate {condition:"minecraft:random_chance",chance:0.95} run function gm4_monsters_unbound:mob/init/mob_type/enderman/nether_wastes
# soul sand valley
execute if biome ~ ~ ~ soul_sand_valley if predicate {condition:"minecraft:random_chance",chance:0.95} run function gm4_monsters_unbound:mob/init/mob_type/enderman/soul_sand_valley

# underground
execute if entity @s[tag=!gm4_sr_extra_mob,predicate=gm4_survival_refightalized:mob/underground] if predicate {condition:"minecraft:random_chance",chance:0.15} run function gm4_monsters_unbound:mob/init/mob_type/enderman/underground
