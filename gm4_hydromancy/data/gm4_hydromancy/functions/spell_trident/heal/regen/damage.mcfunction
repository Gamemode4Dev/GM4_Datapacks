# damage undead entities
# @s = targeted entity
# at spell trident
# run from spell_trident/heal/regen/check_type

scoreboard players add $heal.mana_used gm4_hy_data 3
damage @s 4 trident
effect give @s slowness 1 2
particle enchanted_hit ~ ~1.66 ~ 0.05 0.05 0.05 0.1 3

scoreboard players set $heal.raycast gm4_hy_data 32
execute positioned ~ ~1.65 ~ facing entity @s eyes run function gm4_hydromancy:spell_trident/heal/regen/damage_raycast
