# particle trail to damaged entity
# @s = targeted entity
# at spell trident, raycasting to @s eyes
# run from spell_trident/heal/regen/damage
# run from here

particle enchanted_hit

scoreboard players remove $heal.raycast gm4_hy_data 1
execute if score $heal.raycast gm4_hy_data matches 3.. positioned ~-.5 ~-.5 ~-.5 if entity @s[dx=0,dy=0,dz=0] run scoreboard players set $heal.raycast gm4_hy_data 2
execute if score $heal.raycast gm4_hy_data matches 1.. positioned ^ ^ ^0.25 run function gm4_hydromancy:spell_trident/heal/regen/damage_raycast
