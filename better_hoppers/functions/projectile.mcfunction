#run from main
#@s = projectile on a hopper, at @s

execute as @s[nbt={pickup: 1b}] run function better_hoppers:projectile_player
execute unless data entity @s pickup as @s[nbt={player: 1b}] run function better_hoppers:projectile_player