#run from advancement vehicle_check
#@s = player with tag gm4_vecto_active and not in vehicle

advancement revoke @s only gm4_vecto_shamir:vehicle_check

tag @s add gm4_vecto_player
execute as @e[tag=gm4_vecto_vehicle,distance=2..] if score @s gm4_vecto_id = @p[tag=gm4_vecto_player,distance=..1] gm4_vecto_id run function gm4_vecto_shamir:vehicle/remove
execute unless predicate gm4_vecto_shamir:sneaking as @e[type=minecart,tag=gm4_vecto_vehicle,distance=..2] if score @s gm4_vecto_id = @p[tag=gm4_vecto_player,distance=..1] gm4_vecto_id run team leave @s
tag @s remove gm4_vecto_player
