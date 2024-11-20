# @s = player hitting a mob with a percurro shamir
# at ^ ^ ^4
# run from teleport

# check 1x8x1 cube around target
execute if block ~ ~ ~ #gm4_percurro_shamir:valid_destination run function gm4_percurro_shamir:teleport
execute unless block ~ ~ ~ #gm4_percurro_shamir:valid_destination positioned ~ ~1 ~ run function gm4_percurro_shamir:check_teleport_destination/y_2
