#> gm4_player_motion:api/launch_local_xyz
##
# Launches the player in the input direction relative to the current rotation context
#
# Does not support players in spectator mode nor mounted players
#
# @score $x gm4_player_motion.api.launch - Local X (sideways) velocity to launch with
# @score $y gm4_player_motion.api.launch - Local Y (vertical) velocity to launch with
# @score $z gm4_player_motion.api.launch - Local Z (forward) velocity to launch with
#
# @returns (0 | 1) - `0` if no motion was applied, `1` if motion was applied
##

### Initialize
    ## If all input components are zero, return `0` to indicate no motion was applied
    execute \
        if score $x gm4_player_motion.api.launch matches 0 \
        if score $y gm4_player_motion.api.launch matches 0 \
        if score $z gm4_player_motion.api.launch matches 0 \
        run return 0

    ## Store local launch vector into dummy scores from input scores
    scoreboard players operation #x gm4_player_motion.internal.dummy = $x gm4_player_motion.api.launch
    scoreboard players operation #y gm4_player_motion.internal.dummy = $y gm4_player_motion.api.launch
    scoreboard players operation #z gm4_player_motion.internal.dummy = $z gm4_player_motion.api.launch
###

### If the player viewport angle is the same as the context angle, skip rotation calculation
    ## Test context against player
    scoreboard players set #equal_context gm4_player_motion.internal.dummy 0
    execute positioned ^ ^ ^1 rotated as @s positioned ^ ^ ^-1 if entity @s[distance=..0.00001] run \
        scoreboard players set #equal_context gm4_player_motion.internal.dummy 1
    ## If the player is not looking directly along the polar axis, launch normally, pass the return value of `1` to indicate motion was applied
    execute if score #equal_context gm4_player_motion.internal.dummy matches 1 \
        unless entity @s[x_rotation=-90] run return run function gm4_player_motion:internal/launch/main
    ## Else, handle mojank's broken rotation math, pass the return value of `1` to indicate motion was applied
    execute if score #equal_context gm4_player_motion.internal.dummy matches 1 \
        run return run function gm4_player_motion:internal/launch/handle_polar/local
###

### Else, proceed with rotation calculation
    ## Store local launch vector into matrix x/y/z storage from #x/#y/#z scores
    execute store result storage gm4_player_motion:internal/temp matrix.x double 1 run \
        scoreboard players get #x gm4_player_motion.internal.dummy
    execute store result storage gm4_player_motion:internal/temp matrix.y double 1 run \
        scoreboard players get #y gm4_player_motion.internal.dummy
    execute store result storage gm4_player_motion:internal/temp matrix.z double 1 run \
        scoreboard players get #z gm4_player_motion.internal.dummy

    ## Convert local-to-context launch vector to global launch vector via dummy marker entity, stores directly back into `matrix` x/y/z storage &#x/#y/#z scores
    execute as 9a347e6c-1ce5-434a-b717-6707d51f4299 in minecraft:overworld positioned 0.0 0.0 0.0 run \
        function gm4_player_motion:internal/math/local_to_global with storage gm4_player_motion:internal/temp matrix
        #      ^ (GM4) changed UUID to prevent potential conflict
    ## Continue like `launch_global_xyz` from here

    ## If the player is looking directly along the polar axis, handle as a special case to mitigate mojank's broken rotation math, pass the return value of `1` to indicate motion was applied
    execute if entity @s[x_rotation=-90] run return run function gm4_player_motion:internal/launch/handle_polar/global

    ## Get magnitude 1 left/up/forward local-to-player vectors into vec_i/vec_j/vec_k using dummy marker entity
    execute rotated as @s as 9a347e6c-1ce5-434a-b717-6707d51f4299 in minecraft:overworld positioned 0.0 0.0 0.0 run \
        function gm4_player_motion:internal/math/global/store_reference_vectors
    #      ^ (GM4) changed UUID to prevent potential conflict
    ## Combine vec_k components into a single scoreboard value for comparison
    execute store result score #vec_k_combined gm4_player_motion.internal.dummy run \
        data get storage gm4_player_motion:internal/temp vec_k[0] 10000
    execute store result score #temp1 gm4_player_motion.internal.dummy run \
        data get storage gm4_player_motion:internal/temp vec_k[1] 10000
    execute store result score #temp2 gm4_player_motion.internal.dummy run \
        data get storage gm4_player_motion:internal/temp vec_k[2] 10000
    scoreboard players operation #vec_k_combined gm4_player_motion.internal.dummy += #temp1 gm4_player_motion.internal.dummy
    scoreboard players operation #vec_k_combined gm4_player_motion.internal.dummy += #temp2 gm4_player_motion.internal.dummy

    ## If the previous launch method was also local_xyz and the same vec_k was used, reuse the previous local launch vector to save computation
    execute if score @s gm4_player_motion.internal.previous_method matches 1 \
        if score @s gm4_player_motion.internal.previous_vec_k = #vec_k_combined gm4_player_motion.internal.dummy \
        if score @s gm4_player_motion.internal.previous_x.in = $x gm4_player_motion.api.launch \
        if score @s gm4_player_motion.internal.previous_y.in = $y gm4_player_motion.api.launch \
        if score @s gm4_player_motion.internal.previous_z.in = $z gm4_player_motion.api.launch \
        run return run function gm4_player_motion:internal/launch/use_previous

    ## Store current vec_k combined value and launch method into player scores for potential reuse on next launch
    scoreboard players operation @s gm4_player_motion.internal.previous_vec_k = #vec_k_combined gm4_player_motion.internal.dummy
    scoreboard players set @s gm4_player_motion.internal.previous_method 1

    ##
    # `if (((|x|) > 12398) || ((|y|) > 12398) || ((|z|) > 12398)) large_global_to_local() else global_to_local()`
    # 
    # Use no-tp scoreboard math approximation for global-to-local conversion if all input components are smaller than 12398.
    ##
    scoreboard players set #temp gm4_player_motion.internal.dummy 0
    execute if predicate gm4_player_motion:internal/large_global \
        as 9a347e6c-1ce5-434a-b717-6707d51f4299 in minecraft:overworld positioned 0.0 0.0 0.0 \
        store result score #temp gm4_player_motion.internal.dummy run \
        function gm4_player_motion:internal/math/global/convert_large_to_local
        #      ^ (GM4) changed UUID to prevent potential conflict
    execute if score #temp gm4_player_motion.internal.dummy matches 0 run \
        function gm4_player_motion:internal/math/global/convert_to_local
    
    ## Store input launch vector into `previous_x.in`/`previous_y.in`/`previous_z.in` for potential reuse on next launch
    scoreboard players operation @s gm4_player_motion.internal.previous_x.in = $x gm4_player_motion.api.launch
    scoreboard players operation @s gm4_player_motion.internal.previous_y.in = $y gm4_player_motion.api.launch
    scoreboard players operation @s gm4_player_motion.internal.previous_z.in = $z gm4_player_motion.api.launch
    
    ## Store the local launch vector into `previous_x`/`previous_y`/`previous_z` for potential reuse on next launch
    scoreboard players operation @s gm4_player_motion.internal.previous_x = #x gm4_player_motion.internal.dummy
    scoreboard players operation @s gm4_player_motion.internal.previous_y = #y gm4_player_motion.internal.dummy
    scoreboard players operation @s gm4_player_motion.internal.previous_z = #z gm4_player_motion.internal.dummy
###

## Launch with local launch vector stored in modified #x/#y/#z scores, pass the return value of `1` to indicate motion was applied
return run function gm4_player_motion:internal/launch/main
