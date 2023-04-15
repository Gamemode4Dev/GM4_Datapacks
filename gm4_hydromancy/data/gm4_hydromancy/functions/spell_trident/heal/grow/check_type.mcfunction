# check what block to grow
# @s = growth marker
# at @s, raycasted down
# run from spell_trident/heal/grow/raycast

execute if score $heal.growth_done gm4_hy_data matches 0 if block ~ ~ ~ beetroots run function gm4_hydromancy:spell_trident/heal/grow/crop/beetroots
execute if score $heal.growth_done gm4_hy_data matches 0 if block ~ ~ ~ carrots run function gm4_hydromancy:spell_trident/heal/grow/crop/carrots
execute if score $heal.growth_done gm4_hy_data matches 0 if block ~ ~ ~ potatoes run function gm4_hydromancy:spell_trident/heal/grow/crop/potatoes
execute if score $heal.growth_done gm4_hy_data matches 0 if block ~ ~ ~ wheat run function gm4_hydromancy:spell_trident/heal/grow/crop/wheat
execute if score $heal.growth_done gm4_hy_data matches 0 if block ~ ~ ~ melon_stem run function gm4_hydromancy:spell_trident/heal/grow/crop/melon_stem
execute if score $heal.growth_done gm4_hy_data matches 0 if block ~ ~ ~ pumpkin_stem run function gm4_hydromancy:spell_trident/heal/grow/crop/pumpkin_stem
execute if score $heal.growth_done gm4_hy_data matches 0 if block ~ ~ ~ sweet_berry_bush run function gm4_hydromancy:spell_trident/heal/grow/crop/sweet_berry_bush
execute if score $heal.growth_done gm4_hy_data matches 1 run function gm4_hydromancy:spell_trident/heal/grow/crop/grown

execute if score $heal.growth_done gm4_hy_data matches 0 if block ~ ~ ~ #gm4_hydromancy:dead_coral_block run function gm4_hydromancy:spell_trident/heal/grow/coral/block
execute if score $heal.growth_done gm4_hy_data matches 0 if block ~ ~ ~ #gm4_hydromancy:dead_coral_floor run function gm4_hydromancy:spell_trident/heal/grow/coral/floor
execute if score $heal.growth_done gm4_hy_data matches 0 if block ~ ~ ~ #gm4_hydromancy:dead_coral_wall run function gm4_hydromancy:spell_trident/heal/grow/coral/wall

# mana cost is 5 for crops / coral, 1 for moistening farmland
execute if score $heal.growth_done gm4_hy_data matches 1 run scoreboard players add $heal.mana_used gm4_hy_data 4

execute if score $heal.growth_done gm4_hy_data matches 0 if block ~ ~ ~ farmland run setblock ~ ~ ~ farmland[moisture=7]
scoreboard players add $heal.mana_used gm4_hy_data 1
