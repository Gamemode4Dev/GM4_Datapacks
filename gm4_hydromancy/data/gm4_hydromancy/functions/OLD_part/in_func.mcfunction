

# particles
scoreboard players add @s gm4_hy_timer 1
scoreboard players set @s[scores={gm4_hy_timer=36..}] gm4_hy_timer 0
scoreboard players operation $firework.particle_ring_blade gm4_hy_data = @s gm4_hy_timer
