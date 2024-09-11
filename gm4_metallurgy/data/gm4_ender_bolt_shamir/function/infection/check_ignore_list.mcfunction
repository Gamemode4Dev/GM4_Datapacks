# analyzes an entity that is about to be infected with ender bolt
# @s = a living entity that is not an armor stand
# at source of infection
# run from infection/spread

# store id of pet owner as own id for pets (in case they haven't been processed yet)
execute unless score @s gm4_ender_bolt_own_id matches -2147483648..2147483647 if entity @s[type=#gm4_ender_bolt_shamir:pets] if data entity @s Owner run function gm4_ender_bolt_shamir:id/assign_pet

# start infection
execute if score $enable_pvp gm4_ender_bolt_foreign_id matches 0 unless score @s gm4_ender_bolt_own_id matches -2147483648..2147483647 run function gm4_ender_bolt_shamir:infection/infect
execute if score $enable_pvp gm4_ender_bolt_foreign_id matches 1 unless score @s gm4_ender_bolt_own_id = $source gm4_ender_bolt_foreign_id run function gm4_ender_bolt_shamir:infection/infect
