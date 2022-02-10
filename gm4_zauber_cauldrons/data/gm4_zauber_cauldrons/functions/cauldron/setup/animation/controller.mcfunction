# controls the creation animation
# @s = player able to create a cauldron
# at cauldron position
# scheduled from gm4_zauber_cauldron:cauldron/setup/create

# control animation flow
execute if score $creation_counter gm4_zc_data matches ..40 run schedule function gm4_zauber_cauldrons:cauldron/setup/animation/controller 1t
scoreboard players add $creation_counter gm4_zc_data 1

# display animation frame
execute as @e[type=area_effect_cloud,tag=gm4_zc_creation_animation] at @s run function gm4_zauber_cauldrons:cauldron/setup/animation/step
