# checks whether the player who called this function was in creative or survival/adventure and returns 1 or 0 accordingly.
# @s = a player
# at unspecified
# run from cauldron/liquid/update/<level>/reconstruct_interaction

# sorted by gamemode player is most likely to be in
execute if entity @s[gamemode=survival] run return 0
execute if entity @s[gamemode=creative] run return 1
execute if entity @s[gamemode=adventure] run return 0
return -1
