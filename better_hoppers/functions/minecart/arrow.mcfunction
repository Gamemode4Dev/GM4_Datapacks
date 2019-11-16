#run from projectile_player
#@s = arrow near hopper cart, at ~-.5 ~-1.5 ~-.5 from @s

#check if there is any place in the hopper
execute if data entity @e[dx=1, dy=1.5, dz=1, type=hopper_minecart, nbt={Enabled:1b}, sort=nearest, limit=1] Items[4] run function better_hoppers:minecart/arrow/full
execute unless data entity @e[dx=1, dy=1.5, dz=1, type=hopper_minecart, nbt={Enabled:1b}, sort=nearest, limit=1] Items[4] run function better_hoppers:minecart/arrow/drop