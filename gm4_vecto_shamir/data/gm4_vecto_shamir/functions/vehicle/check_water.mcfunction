#run from active
#@s = player with shamir equipped, sneaking above water

execute if predicate gm4_vecto_shamir:check_area/north positioned ~ ~-.4 ~-1 run function gm4_vecto_shamir:vehicle/spawn_boat
execute unless entity @s[tag=gm4_ml_vecto_active] if predicate gm4_vecto_shamir:check_area/east positioned ~1 ~-.4 ~ run function gm4_vecto_shamir:vehicle/spawn_boat
execute unless entity @s[tag=gm4_ml_vecto_active] if predicate gm4_vecto_shamir:check_area/south positioned ~ ~-.4 ~1 run function gm4_vecto_shamir:vehicle/spawn_boat
execute unless entity @s[tag=gm4_ml_vecto_active] if predicate gm4_vecto_shamir:check_area/west positioned ~-1 ~-.4 ~ run function gm4_vecto_shamir:vehicle/spawn_boat
