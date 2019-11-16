#run from main
#@s = projectile near a hopper minecart, at ~-.5 ~-1.5 ~-.5 from @s

execute as @s[nbt={pickup: 1b}] run function better_hoppers:minecart/projectile_player
execute unless data entity @s pickup as @s[nbt={player: 1b}] run function better_hoppers:minecart/projectile_player