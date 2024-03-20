# rain rings around spell trident
# @s = spell trident
# at @s, positioned ~0.165 up 1-10 times
# run from spell_trident/heal/spell_apply
# run from here

particle rain ^ ^0.2 ^
scoreboard players remove $heal.particle_ring gm4_hy_data 1
execute if score $heal.particle_ring gm4_hy_data matches 1.. rotated ~10 ~ run function gm4_hydromancy:spell_trident/heal/vfx/trident_ring
