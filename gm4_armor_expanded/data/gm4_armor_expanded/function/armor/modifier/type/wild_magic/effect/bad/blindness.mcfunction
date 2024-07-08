
data modify storage gm4_armor_expanded:temp wild_magic.id set value "blindness"

# Duration
execute store result storage gm4_armor_expanded:temp wild_magic.duration int 1 run random value 6..25

# Level
execute store result storage gm4_armor_expanded:temp wild_magic.level int 1 run scoreboard players set $base gm4_ae_data 0
