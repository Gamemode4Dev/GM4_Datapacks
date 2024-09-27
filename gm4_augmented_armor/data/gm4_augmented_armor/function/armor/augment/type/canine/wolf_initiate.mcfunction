# match wolf to armor slot and player id
# @s = new wolf
# at unspecified
# run from armor/type/canine/wolf_spawn

data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:stone",count:1}],CollarColor:0b,variant:"gm4_augmented_armor:gm4_aa_canine",Tags:["gm4_aa_wolf"],active_effects:[{id:"minecraft:resistance",amplifier:9b,duration:-1,show_particles:0b}],attributes:[{id:"minecraft:generic.attack_damage",base:4},{id:"minecraft:generic.scale",base:1.15,}]}

scoreboard players operation @s gm4_aa_id = $curr_id gm4_aa_id
scoreboard players operation @s gm4_aa_data = $slot gm4_aa_data
data modify entity @s Owner set from storage gm4_augmented_armor:temp uuid

# if named Pistachio use the alt dog version, don't display name
execute if data storage gm4_augmented_armor:temp components{"minecraft:custom_name":'"Pistachio"'} run return run data merge entity @s {variant:"gm4_augmented_armor:gm4_aa_canine_alt",CollarColor:5b}

# store name of armor in wolf name and on hidden stone block for later checks
data modify entity @s CustomName set from storage gm4_augmented_armor:temp components."minecraft:custom_name"
data modify entity @s ArmorItems[3].components."minecraft:custom_name" set from storage gm4_augmented_armor:temp components."minecraft:custom_name"
