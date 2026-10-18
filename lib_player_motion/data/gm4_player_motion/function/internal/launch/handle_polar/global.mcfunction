#> global.mcfunction
##
# During the global polar axis case, mitigate mojank's broken rotation math
#
# When:
# - Global launch vector is needed & already converted to local space
# - Player is looking directly along the polar axis (x rotation of `-90` degrees)
##

## Only x and y need to be rotated to compensate for mojank's broken rotation math, if both are zero the launch can continue without handling.
execute \
    if score #x gm4_player_motion.internal.dummy matches 0 \
    if score #y gm4_player_motion.internal.dummy matches 0 \
    run return run function gm4_player_motion:internal/launch/main

### Explanation & video: https://discord.com/channels/154777837382008833/1221689674611818556/1444803724043354144
    ## Swap y and z
    scoreboard players operation #y gm4_player_motion.internal.dummy >< #z gm4_player_motion.internal.dummy

    ## If y horizontal rotation is between 90 and -90, flip sign of x.
    scoreboard players set #y_abs_within_90 gm4_player_motion.internal.dummy 0
    execute if entity @s[y_rotation=90..-90] \
        store success score #y_abs_within_90 gm4_player_motion.internal.dummy run \
        scoreboard players operation #x gm4_player_motion.internal.dummy *= #constant.-1 gm4_player_motion.internal.const

    ## Else, flip sign of y.
    execute if score #y_abs_within_90 gm4_player_motion.internal.dummy matches 0 run \
        scoreboard players operation #y gm4_player_motion.internal.dummy *= #constant.-1 gm4_player_motion.internal.const
###

## Launch locally with modified #x/#y scores and the original $z score, pass the return value of `1` to indicate motion was applied
return run function gm4_player_motion:internal/launch/main
