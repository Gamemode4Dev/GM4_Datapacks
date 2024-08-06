# calculate modifiers for newly spawned skeleton / stray
# @s = skeleton / stray
# at @s
# run from mob/init/mob_type

# elites
execute if predicate gm4_monsters_unbound:chance/skeleton/elite_chance run function gm4_monsters_unbound:mob/init/elite/pick_type

# | Biome Modifiers
# snowy
execute if entity @s[type=stray,predicate=gm4_monsters_unbound:biome/snowy,predicate=!gm4_monsters_unbound:biome/growth] store success score $arrow gm4_mu_data run loot replace entity @s weapon.offhand loot gm4_monsters_unbound:mob/equip_arrow/stray_snowy
# mountainous
execute if predicate gm4_monsters_unbound:biome/mountainous positioned ~ ~35 ~ store result score $phantom_count gm4_mu_data if entity @e[type=phantom,distance=..32]
execute if score $phantoms gm4_mu_data matches 0 if score $nearby_home_bed gm4_mu_data matches 0 if score $phantom_count gm4_mu_data < $mob_limit.phantom gm4_mu_data if predicate gm4_monsters_unbound:chance/phantom/spawn store success score $mob_extras gm4_sr_data run summon phantom ~ ~35 ~ {Tags:["gm4_mu_extra_mob","gm4_mu_phantom"]}
# flowering
execute if predicate gm4_monsters_unbound:chance/skeleton/replace_with_zombie run function gm4_monsters_unbound:mob/init/mob_type/skeleton/flowering
# toxic
execute if entity @s[type=!stray,predicate=gm4_monsters_unbound:biome/toxic,predicate=!gm4_monsters_unbound:biome/growth] store success score $arrow gm4_mu_data run loot replace entity @s weapon.offhand loot gm4_monsters_unbound:mob/equip_arrow/skeleton_toxic
execute if entity @s[type=stray,predicate=gm4_monsters_unbound:biome/toxic,predicate=!gm4_monsters_unbound:biome/growth] store success score $arrow gm4_mu_data run loot replace entity @s weapon.offhand loot gm4_monsters_unbound:mob/equip_arrow/stray_toxic
# growth
execute if predicate gm4_monsters_unbound:biome/growth run function gm4_monsters_unbound:mob/init/mob_type/skeleton/growth
# soul sand valley
execute if predicate gm4_monsters_unbound:biome/nether/soul_sand_valley run effect give @s fire_resistance infinite 0 true

# | Difficulty Modifiers
# harming arrow
execute if entity @s[type=!stray,tag=!gm4_mu_elite] store success score $arrow gm4_mu_data run loot replace entity @s[predicate=gm4_monsters_unbound:chance/skeleton/harming_arrow,predicate=!gm4_monsters_unbound:biome/growth] weapon.offhand loot gm4_monsters_unbound:mob/equip_arrow/skeleton_harming
execute if entity @s[type=stray,tag=!gm4_mu_elite] store success score $arrow gm4_mu_data run loot replace entity @s[predicate=gm4_monsters_unbound:chance/skeleton/harming_arrow,predicate=!gm4_monsters_unbound:biome/growth] weapon.offhand loot gm4_monsters_unbound:mob/equip_arrow/stray_harming

# drop rate for custom arrows
execute if score $arrow gm4_mu_data matches 1 run data modify entity @s HandDropChances[1] set value 0.25F
