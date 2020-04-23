# @s = player hitting a mob with a percurro shamir
# at ^ ^ ^4
# run from teleport

# check 1x8x1 cube around target
execute if block ~ ~ ~ #gm4_percurro_shamir:valid_destination run function gm4_percurro_shamir:teleport
