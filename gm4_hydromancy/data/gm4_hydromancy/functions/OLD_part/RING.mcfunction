
scoreboard players remove $firework.particle gm4_hy_data 1
particle dolphin ^ ^ ^2.5 0.25 0.25 0.25 0 1 normal
particle dolphin ^ ^ ^-2.5 0.25 0.25 0.25 0 1 normal
execute if score $firework.particle gm4_hy_data matches 1.. rotated ~30 ~6 run function gm4_hydromancy:spell_trident/firework/particles
