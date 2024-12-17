
execute as @e[predicate=gm4_augmented_armor:technical/pvp_able,distance=..9,tag=!gm4_aa_augment_damager] run function gm4_augmented_armor:armor/augment/type/blastshot/damage with storage gm4_augmented_armor:temp blastshot

# effects
playsound entity.generic.explode player @a[distance=..64] ~ ~ ~ 0.85 1.15 0.25
playsound entity.generic.explode player @a[distance=..64] ~ ~ ~ 1 1.025 0.5
particle explosion ~ ~ ~ 0.2 0.2 0.2 0.5 2 force @a[distance=..64]
particle explosion ~ ~ ~ 0.75 0.75 0.75 0.5 6 force @a[distance=..64]
