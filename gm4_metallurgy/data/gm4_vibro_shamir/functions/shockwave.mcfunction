# @s = player wearing vibro boots that just took fall damage
# run from advancement vibro_fall_damage

advancement revoke @s only gm4_vibro_shamir:vibro_fall_damage

scoreboard players operation @s gm4_vibro_shock = @s gm4_vibro_hurt

schedule function gm4_vibro_shamir:shock/activate 1t
