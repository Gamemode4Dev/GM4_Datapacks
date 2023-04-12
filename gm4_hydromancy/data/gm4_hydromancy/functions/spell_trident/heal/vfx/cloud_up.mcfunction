
scoreboard players remove $heal.cloud_height gm4_hy_data 1
#particle rain ~ ~-.25 ~ 0.05 0.2 0.05 0 6
execute unless block ~ ~.5 ~ #gm4:no_collision run scoreboard players set $heal.cloud_height gm4_hy_data 0
execute if score $heal.cloud_height gm4_hy_data matches 0 run function gm4_hydromancy:spell_trident/heal/vfx/cloud_ring
execute if score $heal.cloud_height gm4_hy_data matches 1.. positioned ~ ~.5 ~ run function gm4_hydromancy:spell_trident/heal/vfx/cloud_up
