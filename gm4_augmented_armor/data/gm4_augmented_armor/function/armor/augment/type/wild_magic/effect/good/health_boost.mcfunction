
data modify storage gm4_augmented_armor:temp wild_magic.id set value "health_boost"

# Duration
execute store result storage gm4_augmented_armor:temp wild_magic.duration int 1 run random value 45..120

# Level
scoreboard players set $add gm4_aa_data 4
execute store result storage gm4_augmented_armor:temp wild_magic.level int 1 run loot spawn 29999998 1 7133 loot gm4_augmented_armor:technical/wild_magic_level