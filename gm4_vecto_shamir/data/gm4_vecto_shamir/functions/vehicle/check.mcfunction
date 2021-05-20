#run from vehicle/spawn_(boat/minecart) and vehicle/check

execute as @e[tag=gm4_ml_vehicle] at @a[tag=gm4_ml_invehicle,predicate=gm4_vecto_shamir:not_in_vehicle] if score @s gm4_ml_vecto_id = @p[tag=gm4_ml_invehicle,predicate=gm4_vecto_shamir:not_in_vehicle,distance=..1,sort=nearest] gm4_ml_vecto_id run function gm4_vecto_shamir:vehicle/remove
execute unless entity @e[tag=gm4_ml_vehicle] run tag @a remove gm4_ml_invehicle
execute if entity @e[tag=gm4_ml_vehicle] run schedule function gm4_vecto_shamir:vehicle/check 16t
