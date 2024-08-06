
data modify storage gm4_augmented_armor:temp wild_magic.id set value "blindness"

# Duration
execute store result storage gm4_augmented_armor:temp wild_magic.duration int 1 run random value 6..25

# Level
execute store result storage gm4_augmented_armor:temp wild_magic.level int 1 run scoreboard players set $base gm4_aa_data 0
