
data modify storage gm4_armor_expanded:temp wild_magic.id set value "instant_damage"

# Duration
execute store result storage gm4_armor_expanded:temp wild_magic.duration int 1 run scoreboard players set $base gm4_ae_data 1

# Level
scoreboard players set $add gm4_ae_data 2
execute store result storage gm4_armor_expanded:temp wild_magic.level int 1 run loot spawn 29999998 1 7133 loot gm4_armor_expanded:technical/wild_magic_level