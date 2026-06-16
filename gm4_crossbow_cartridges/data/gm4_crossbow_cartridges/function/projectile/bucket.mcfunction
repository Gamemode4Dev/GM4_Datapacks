# Check bucket type and shoot
# @s = player using the crossbow
# at arrow
# run from check_projectile

tag @s add gm4_cb_use

execute if predicate gm4_crossbow_cartridges:items/axolotl run function gm4_crossbow_cartridges:projectile/bucket/axolotl
execute if predicate gm4_crossbow_cartridges:items/cod run function gm4_crossbow_cartridges:projectile/bucket/cod
execute if predicate gm4_crossbow_cartridges:items/pufferfish run function gm4_crossbow_cartridges:projectile/bucket/pufferfish
execute if predicate gm4_crossbow_cartridges:items/salmon run function gm4_crossbow_cartridges:projectile/bucket/salmon
execute if predicate gm4_crossbow_cartridges:items/sulfur_cube run function gm4_crossbow_cartridges:projectile/bucket/sulfur_cube
execute if predicate gm4_crossbow_cartridges:items/tadpole run function gm4_crossbow_cartridges:projectile/bucket/tadpole
execute if predicate gm4_crossbow_cartridges:items/tropical run function gm4_crossbow_cartridges:projectile/bucket/tropical

# give advancement for launching mob in a bucket
execute unless predicate gm4_crossbow_cartridges:items/sulfur_cube run advancement grant @s only gm4:crossbow_cartridges_bucket

# replace filled bucket in player's offhand with water bucket
execute if predicate gm4_crossbow_cartridges:items/sulfur_cube run return run item replace entity @s[gamemode=!creative] weapon.offhand with minecraft:bucket
item replace entity @s[gamemode=!creative] weapon.offhand with minecraft:water_bucket
