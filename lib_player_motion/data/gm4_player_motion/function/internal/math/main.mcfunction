#> gm4_player_motion:internal/math/main

# full_power=sqrt(motion_x²+motion_y²+motion_z²)
    # Save sign of $motion_y
	execute store success score $negative_sine gm4_player_motion.internal.math \
	    if score $motion_y gm4_player_motion.internal.math matches ..-1

    # Normalize
        execute if score $motion_x gm4_player_motion.internal.math matches ..-1 run \
            scoreboard players operation $motion_x gm4_player_motion.internal.math *= #constant.-1 gm4_player_motion.internal.const

        execute if score $motion_y gm4_player_motion.internal.math matches ..-1 run \
            scoreboard players operation $motion_y gm4_player_motion.internal.math *= #constant.-1 gm4_player_motion.internal.const

        execute if score $motion_z gm4_player_motion.internal.math matches ..-1 run \
            scoreboard players operation $motion_z gm4_player_motion.internal.math *= #constant.-1 gm4_player_motion.internal.const

    # Sets angle before exchange
        scoreboard players set $angle gm4_player_motion.internal.math 0

        execute if score $motion_y gm4_player_motion.internal.math matches 0 run \
            scoreboard players set $angle gm4_player_motion.internal.math 1

    # SuperSwordTW's method. Credit: https://github.com/SuperSwordTW/Distance-Trig-Calc-3d
        execute if score $motion_y gm4_player_motion.internal.math matches 0 run \
            scoreboard players operation $motion_y gm4_player_motion.internal.math >< $motion_x gm4_player_motion.internal.math

        execute if score $motion_y gm4_player_motion.internal.math matches 0 run \
            scoreboard players operation $motion_y gm4_player_motion.internal.math >< $motion_z gm4_player_motion.internal.math

        function gm4_player_motion:internal/math/full_power/trig

# n_full_exp=floor(full_power/0.865)
    scoreboard players operation $n_full_exp gm4_player_motion.internal.math /= #constant.fpc gm4_player_motion.internal.const

# Change back the angle
    execute if score $angle gm4_player_motion.internal.math matches 1 run data modify storage gm4_player_motion:math magnitude.angle set value 0

# eyelevel=y(eyes)-y(player)
    function gm4_player_motion:internal/math/eyelevel

# sub power operations
    # sub_power=floor(full_power%0.8)
        scoreboard players operation $sub_power gm4_player_motion.internal.math %= #constant.fpc gm4_player_motion.internal.const

    # d12=1-sub_power
        scoreboard players set $d12 gm4_player_motion.internal.math 10000
        scoreboard players operation $d12 gm4_player_motion.internal.math -= $sub_power gm4_player_motion.internal.math

    # Formula d=-(eyelevel*sinα + d12*12 * cos(arcsin(cosα*eyelevel/(d12*12))))

    # d12 = d12*12
    scoreboard players operation $d12 gm4_player_motion.internal.math *= #constant.12 gm4_player_motion.internal.const

    # Obtain sinα and cosα
    function gm4_player_motion:internal/math/trig/sine with storage gm4_player_motion:math magnitude

    # cosα *= eyelevel, record cosα for later use
    scoreboard players operation $cosine gm4_player_motion.internal.math *= $eyelevel gm4_player_motion.internal.math
        scoreboard players operation $cosine1 gm4_player_motion.internal.math = $cosine gm4_player_motion.internal.math
    
    # cosα /= d12 = cosα*eyelevel / (d12*12)
    scoreboard players operation $cosine gm4_player_motion.internal.math *= #constant.10 gm4_player_motion.internal.const

    scoreboard players operation $cosine gm4_player_motion.internal.math /= $d12 gm4_player_motion.internal.math

    # obtain cos(arcsin(cosα*eyelevel/(d12*12))))
    execute store result storage gm4_player_motion:math magnitude.quotient int 1 run scoreboard players get $cosine gm4_player_motion.internal.math

    function gm4_player_motion:internal/math/trig/arcsine with storage gm4_player_motion:math magnitude

    # cos(arcsin(cosα*eyelevel/(d12)))) *= d12
    scoreboard players operation $d gm4_player_motion.internal.math *= $d12 gm4_player_motion.internal.math

    scoreboard players operation $d gm4_player_motion.internal.math /= #constant.1000 gm4_player_motion.internal.const

    # sinα *= eyelevel, record sine for later use
    scoreboard players operation $sine gm4_player_motion.internal.math *= $eyelevel gm4_player_motion.internal.math

    scoreboard players operation $sine gm4_player_motion.internal.math /= #constant.10 gm4_player_motion.internal.const

        scoreboard players operation $sine1 gm4_player_motion.internal.math = $sine gm4_player_motion.internal.math

    # d += sine
    execute store result storage gm4_player_motion:math d double -0.0001 run \
    scoreboard players operation $d gm4_player_motion.internal.math += $sine gm4_player_motion.internal.math


# full power operations
    # d12=1-fpc(0.8) = 0.2
        scoreboard players set $d12 gm4_player_motion.internal.math 2000

    #full_d = -(eyelevel*sinα + (d12*12)*cos(arcsin(cosα*eyelevel/(d12*12))))

    # d12 = d12*12
    scoreboard players operation $d12 gm4_player_motion.internal.math *= #constant.12 gm4_player_motion.internal.const

    # cosine1 = cosα*eyelevel, cosine1 /= d12
    scoreboard players operation $cosine1 gm4_player_motion.internal.math *= #constant.10 gm4_player_motion.internal.const

    scoreboard players operation $cosine1 gm4_player_motion.internal.math /= $d12 gm4_player_motion.internal.math

    # Obtain cos(arcsin(cosine1))
    execute store result storage gm4_player_motion:math magnitude.quotient int 1 run scoreboard players get $cosine1 gm4_player_motion.internal.math

    function gm4_player_motion:internal/math/trig/arcsine with storage gm4_player_motion:math magnitude

    # cos(arcsin(cosα*eyelevel/(d12)))) *= d12
    scoreboard players operation $d gm4_player_motion.internal.math *= $d12 gm4_player_motion.internal.math
    scoreboard players operation $d gm4_player_motion.internal.math /= #constant.1000 gm4_player_motion.internal.const

    # d += sine1
    execute store result storage gm4_player_motion:math full_d double -0.0001 run \
    scoreboard players operation $d gm4_player_motion.internal.math += $sine1 gm4_player_motion.internal.math
