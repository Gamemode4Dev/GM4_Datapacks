#run from advancement vehicle_check
#@s = player with tag gm4_vecto_active and not in vehicle

advancement revoke @s only gm4_vecto_shamir:vehicle_check

execute at @e[type=#gm4_vecto_shamir:vehicle,tag=gm4_vecto_vehicle,distance=2..] if score @s gm4_vecto_id = @e[type=#gm4_vecto_shamir:vehicle,tag=gm4_vecto_vehicle,distance=..1,sort=nearest,limit=1] gm4_vecto_id run function gm4_vecto_shamir:vehicle/remove
execute unless predicate gm4_vecto_shamir:sneaking at @e[type=#gm4_vecto_shamir:vehicle,tag=gm4_vecto_vehicle,distance=..2] if score @s gm4_vecto_id = @e[type=#gm4_vecto_shamir:vehicle,tag=gm4_vecto_vehicle,distance=..1,sort=nearest,limit=1] gm4_vecto_id run team leave @e[type=#gm4_vecto_shamir:vehicle,tag=gm4_vecto_vehicle,distance=..1,sort=nearest,limit=1]
