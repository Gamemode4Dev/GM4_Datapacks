# calculate modifiers for newly spawned skeleton / stray
# @s = skeleton / stray
# at @s
# run from mob/init/mob_type

# elites
execute if predicate {condition:"minecraft:random_chance",chance:0.05} run function gm4_monsters_unbound:mob/init/elite/pick_type

# | Biome Modifiers
# snowy
execute if entity @s[type=stray,predicate=gm4_monsters_unbound:biome/snowy,predicate=!gm4_monsters_unbound:biome/growth] run loot replace entity @s weapon.offhand loot gm4_monsters_unbound:mob/equip_arrow/stray_snowy
# mountainous
execute if predicate gm4_monsters_unbound:biome/mountainous positioned ~ ~35 ~ store result score $phantom_count gm4_mu_data if entity @e[type=phantom,distance=..32]
execute if score $phantoms gm4_mu_data matches 0 if score $nearby_home_bed gm4_mu_data matches 0 if score $phantom_count gm4_mu_data < $mob_limit.phantom gm4_mu_data if predicate gm4_monsters_unbound:chance/phantom/spawn store success score $mob_extras gm4_sr_data run summon phantom ~ ~35 ~ {Tags:["gm4_sr_extra_mob","gm4_mu_phantom"]}
# flowering
execute if predicate {condition:"minecraft:all_of",terms:[{condition:"minecraft:random_chance",chance:0.85},{condition:"minecraft:reference",name:"gm4_monsters_unbound:biome/flowering"}]} run function gm4_monsters_unbound:mob/init/mob_type/skeleton/flowering
# toxic
execute if entity @s[type=!stray,predicate=gm4_monsters_unbound:biome/toxic,predicate=!gm4_monsters_unbound:biome/growth] run loot replace entity @s weapon.offhand loot gm4_monsters_unbound:mob/equip_arrow/skeleton_toxic
execute if entity @s[type=stray,predicate=gm4_monsters_unbound:biome/toxic,predicate=!gm4_monsters_unbound:biome/growth] run loot replace entity @s weapon.offhand loot gm4_monsters_unbound:mob/equip_arrow/stray_toxic
# growth
execute if predicate gm4_monsters_unbound:biome/growth run function gm4_monsters_unbound:mob/init/mob_type/skeleton/growth
# soul sand valley
execute if predicate gm4_monsters_unbound:biome/nether/soul_sand_valley run effect give @s fire_resistance infinite 0 true
