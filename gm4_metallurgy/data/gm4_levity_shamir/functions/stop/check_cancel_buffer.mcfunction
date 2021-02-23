# called when a player who was levitating stops to give them a small buffer
# run from levity_shamir:player_sneaking
# @s = player with levity boots who was shifting but is not any more
scoreboard players add @s gm4_levity_buf 1
execute if score @s gm4_levity_buf matches 10.. run function gm4_levity_shamir:stop/cancel_levitation
execute as @s[nbt={OnGround:1b}] run function gm4_levity_shamir:stop/cancel_levitation