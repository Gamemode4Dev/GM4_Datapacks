# @s = none
# at world spawn
# run from main

# run player checks
execute as @a[gamemode=!spectator] run function gm4_zauber_cauldrons:player/slow_clock

# release vexes from bottled vexes
execute as @e[type=item,nbt={Item:{tag:{gm4_zauber_cauldrons:{item:"bottled_vex"}}}}] at @s run function gm4_zauber_cauldrons:cauldron/extra_items/release_from_bottle
scoreboard players set slow_clock gm4_zc_data 0
