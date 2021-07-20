# Check fish/axolotl and shoot
# @s = player using the crossbow
# at @s
# run from check_projectile

execute if predicate gm4_crossbow_cartridges:items/cod run function gm4_crossbow_cartridges:projectile/bucket/cod
execute if predicate gm4_crossbow_cartridges:items/salmon run function gm4_crossbow_cartridges:projectile/bucket/salmon
execute if predicate gm4_crossbow_cartridges:items/pufferfish run function gm4_crossbow_cartridges:projectile/bucket/pufferfish
execute if predicate gm4_crossbow_cartridges:items/tropical run function gm4_crossbow_cartridges:projectile/bucket/tropical
execute if predicate gm4_crossbow_cartridges:items/axolotl run function gm4_crossbow_cartridges:projectile/bucket/axolotl

# copy motion of arrow to fish/axolotl
function gm4_crossbow_cartridges:projectile/arrow_motion

# replace filled bucket in player's offhand with water bucket
item replace entity @s[gamemode=!creative] weapon.offhand with minecraft:water_bucket

# give player advancement for shooting a fish
execute unless predicate gm4_crossbow_cartridges:items/axolotl run advancement grant @s only gm4:crossbow_cartridges_fish
