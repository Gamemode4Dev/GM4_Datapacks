# @s = player with shamir equipped, sneaking above water
# at @s
# run from active

# rotate check towards water
execute if block ~ ~-1 ~-1 #gm4:full_collision rotated 0 0 run function gm4_vecto_shamir:vehicle/check_boat_collision
execute unless entity @s[tag=gm4_vecto_active] if block ~1 ~-1 ~ #gm4:full_collision rotated 90 0 run function gm4_vecto_shamir:vehicle/check_boat_collision
execute unless entity @s[tag=gm4_vecto_active] if block ~ ~-1 ~1 #gm4:full_collision rotated 180 0 run function gm4_vecto_shamir:vehicle/check_boat_collision
execute unless entity @s[tag=gm4_vecto_active] if block ~-1 ~-1 ~ #gm4:full_collision rotated -90 0 run function gm4_vecto_shamir:vehicle/check_boat_collision
