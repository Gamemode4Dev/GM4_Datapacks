# check what block to grow
# @s = growth marker
# at @s, raycasted down
# run from spell_trident/heal/grow/raycast

scoreboard players add $heal.mana_used gm4_hy_data 1

execute if score $heal.growth_done gm4_hy_data matches 0 if block ~ ~ ~ carrots run function gm4_hydromancy:spell_trident/heal/grow/carrots
# TODO: add all growables
