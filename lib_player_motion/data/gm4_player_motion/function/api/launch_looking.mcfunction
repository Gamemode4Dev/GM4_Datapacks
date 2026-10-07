#> gm4_player_motion:api/launch_looking
##
# @deprecated - Converts from a legacy end crystal explosion tuned launch strength into a `apply_impulse` launch vector. The conversion is approximate and slower than using `launch_local_xyz` directly.
#
# Launches the player backward or forward along the current rotation context
#
# Does not support players in spectator mode
#
# @score $strength gm4_player_motion.api.launch (-64000..64000) - Approximate local Z velocity to launch with
##

### Initialize
    ## If the player is riding a vehicle, fail the launch, new API requires unmounted players before launching
    execute on vehicle run return fail

    ## If strength is zero, return early
    execute if score $strength gm4_player_motion.api.launch matches 0 run return 0

    ## Zero out x & y components for local launch vector
    data modify storage gm4_player_motion:internal/temp matrix set value {x: 0.0d, y: 0.0d}
    execute store result score #x gm4_player_motion.internal.dummy run scoreboard players set #y gm4_player_motion.internal.dummy 0
###

### Convert
    ## Backup the sign of $strength and store the absolute value of $strength into the conversion & conversion index scores
    execute store result score #bucket_index gm4_player_motion.internal.dummy run \
        scoreboard players operation #crystal gm4_player_motion.internal.dummy = $strength gm4_player_motion.api.launch
    scoreboard players set #sign gm4_player_motion.internal.dummy 1
    execute if score #crystal gm4_player_motion.internal.dummy matches ..-1 run scoreboard players set #sign gm4_player_motion.internal.dummy -1
    execute if score #crystal gm4_player_motion.internal.dummy matches ..-1 \ 
        store result score #bucket_index gm4_player_motion.internal.dummy run \
        scoreboard players operation #crystal gm4_player_motion.internal.dummy *= #sign gm4_player_motion.internal.dummy

    ## Calculate conversion index from strength ((strength - 1) / 2000)
    scoreboard players remove #bucket_index gm4_player_motion.internal.dummy 1
    execute store result storage gm4_player_motion:internal/temp convert.index int 1 run \
        scoreboard players operation #bucket_index gm4_player_motion.internal.dummy /= #constant.2000 gm4_player_motion.internal.const

    ## Run conversion of strength input (crystal-tuned) to approximately equivalent `apply_impulse` method z component, bucket function restores sign, store in #z & matrix.z
    execute store result score #z gm4_player_motion.internal.dummy store result storage gm4_player_motion:internal/temp matrix.z double 1 run \
        function gm4_player_motion:internal/convert_from_legacy/index with storage gm4_player_motion:internal/temp convert
###

### `launch_local_xyz` flow

    ### If the player viewport angle is the same as the context angle, skip rotation calculation
        ## Test context against player
        scoreboard players set #equal_context gm4_player_motion.internal.dummy 0
        execute positioned ^ ^ ^1 rotated as @s positioned ^ ^ ^-1 if entity @s[distance=..0.00001] run \
            scoreboard players set #equal_context gm4_player_motion.internal.dummy 1
        ## If the player is not looking directly along the polar axis, launch normally, pass the return value of `1` to indicate motion was applied
        execute if score #equal_context gm4_player_motion.internal.dummy matches 1 \
            unless entity @s[x_rotation=-90] run return run function gm4_player_motion:internal/launch/main
        ## Else, mitigate mojank's broken rotation math, pass the return value of `1` to indicate motion was applied
        execute if score #equal_context gm4_player_motion.internal.dummy matches 1 \
            run return run function gm4_player_motion:internal/launch/handle_polar/local
    ###

    ## Else, proceed with rotation Matrix x/y/z are already set from above, so skip that step

    ## Convert local-to-context launch vector to global launch vector via dummy marker entity, stores directly back into `matrix` x/y/z storage &#x/#y/#z scores
    execute as 9a347e6c-1ce5-434a-b717-6707d51f4299 in minecraft:overworld positioned 0.0 0.0 0.0 run \
        function gm4_player_motion:internal/math/local_to_global with storage gm4_player_motion:internal/temp matrix
        #      ^ (GM4) changed UUID to prevent potential conflict
    ## Continue like `launch_global_xyz` from here

    ## If the player is looking directly along the polar axis, handle as a special case to mitigate mojank's broken rotation math
    execute if entity @s[x_rotation=-90] run return run function gm4_player_motion:internal/launch/handle_polar/global

    ## Get magnitude 1 left/up/forward local-to-player vectors into vec_i/vec_j/vec_k using dummy marker entity
    execute rotated as @s as 9a347e6c-1ce5-434a-b717-6707d51f4299 in minecraft:overworld positioned 0.0 0.0 0.0 run \
        function gm4_player_motion:internal/math/global/store_reference_vectors
         #                      ^ (GM4) changed UUID to prevent potential conflict
    ## Combine vec_k components into a single scoreboard value for comparison
    execute store result score #vec_k_combined gm4_player_motion.internal.dummy run \
        data get storage gm4_player_motion:internal/temp vec_k[0] 10000
    execute store result score #temp1 gm4_player_motion.internal.dummy run \
        data get storage gm4_player_motion:internal/temp vec_k[1] 10000
    execute store result score #temp2 gm4_player_motion.internal.dummy run \
        data get storage gm4_player_motion:internal/temp vec_k[2] 10000
    scoreboard players operation #vec_k_combined gm4_player_motion.internal.dummy += #temp1 gm4_player_motion.internal.dummy
    scoreboard players operation #vec_k_combined gm4_player_motion.internal.dummy += #temp2 gm4_player_motion.internal.dummy

    ## If the previous launch method was also legacy looking and the same vec_k was used, reuse the previous local launch vector to save computation
    execute if score @s gm4_player_motion.internal.previous_method matches 2 \
        if score @s gm4_player_motion.internal.previous_vec_k = #vec_k_combined gm4_player_motion.internal.dummy \
        if score @s gm4_player_motion.internal.previous_z.in = $z gm4_player_motion.api.launch \
        run return run function gm4_player_motion:internal/launch/use_previous

    ## Store current vec_k combined value and launch method into player scores for potential reuse on next launch
    scoreboard players operation @s gm4_player_motion.internal.previous_vec_k = #vec_k_combined gm4_player_motion.internal.dummy
    scoreboard players set @s gm4_player_motion.internal.previous_method 2

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

    ## Store input launch vector into `previous_z.in` for potential reuse on next launch
    scoreboard players operation @s gm4_player_motion.internal.previous_z.in = $z gm4_player_motion.api.launch
    
    ## Store the local launch vector into `previous_x`/`previous_y`/`previous_z` for potential reuse on next launch
    scoreboard players operation @s gm4_player_motion.internal.previous_x = #x gm4_player_motion.internal.dummy
    scoreboard players operation @s gm4_player_motion.internal.previous_y = #y gm4_player_motion.internal.dummy
    scoreboard players operation @s gm4_player_motion.internal.previous_z = #z gm4_player_motion.internal.dummy

    ## Launch with local launch vector stored in modified #x/#y/#z scores
    function gm4_player_motion:internal/launch/main
###
