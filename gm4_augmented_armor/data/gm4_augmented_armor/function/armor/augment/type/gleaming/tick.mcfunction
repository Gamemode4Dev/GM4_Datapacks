
# activate damage effects at different times so they can all apply
execute if score $gleaming_timer gm4_aa_data matches 1 if score @s gm4_aa_augment.gleaming.burning matches 1.. run function gm4_augmented_armor:armor/augment/type/gleaming/burning/activate
execute if score $gleaming_timer gm4_aa_data matches 21 if score @s gm4_aa_augment.gleaming.frost matches 1.. run function gm4_augmented_armor:armor/augment/type/gleaming/frost/activate
execute if score $gleaming_timer gm4_aa_data matches 41 if score @s gm4_aa_augment.gleaming.luminous matches 1.. run function gm4_augmented_armor:armor/augment/type/gleaming/luminous/activate

# particle ring
scoreboard players add @s gm4_aa_augment.gleaming.particle 5
scoreboard players remove @s[scores={gm4_aa_augment.gleaming.particle=360..}] gm4_aa_augment.gleaming.particle 360
scoreboard players operation $particle_ring gm4_aa_data = @s gm4_aa_augment.gleaming.particle
execute rotated 0 0 run function gm4_augmented_armor:armor/augment/type/gleaming/particle_ring

# tick down timer
scoreboard players remove @s[scores={gm4_aa_augment.gleaming.timer=1..}] gm4_aa_augment.gleaming.timer 1

execute if score @s gm4_aa_augment.gleaming.timer matches 0 run return run function gm4_augmented_armor:armor/augment/type/gleaming/remove_stacks
scoreboard players set $keep_tick.gleaming gm4_aa_keep_tick 1
