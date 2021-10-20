# @s = player with tag gm4_vecto_active and not in vehicle
# at @s
# run from advancement vehicle_check

advancement revoke @s only gm4_vecto_shamir:vehicle_check

# copy player id
scoreboard players operation $current gm4_vecto_id = @s gm4_vecto_id

# remove vehicle if too far away from player
execute as @e[type=#gm4_vecto_shamir:vehicle,tag=gm4_vecto_vehicle,distance=2..] if score @s gm4_vecto_id = $current gm4_vecto_id run function gm4_vecto_shamir:vehicle/remove

# enable collision if not sneaking
execute unless predicate gm4_vecto_shamir:sneaking as @e[type=#gm4_vecto_shamir:vehicle,tag=gm4_vecto_vehicle,distance=..2] if score @s gm4_vecto_id = $current gm4_vecto_id run team leave @s
