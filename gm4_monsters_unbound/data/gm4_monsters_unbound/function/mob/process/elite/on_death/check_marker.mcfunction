
scoreboard players set $elite_alive gm4_mu_data 0
execute on vehicle if entity @s[nbt=!{Health:0.0f}] run scoreboard players set $elite_alive gm4_mu_data 1
execute if score $elite_alive gm4_mu_data matches 0 run function gm4_monsters_unbound:mob/process/elite/on_death/trigger
