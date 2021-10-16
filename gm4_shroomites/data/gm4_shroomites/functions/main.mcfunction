# manages a scoreboard clock system to tie the module in with the random tick speed gamerule

# manage clock speed
execute store result score $random_tick_speed gm4_shroom_data run gamerule randomTickSpeed
scoreboard players operation $fast_clock gm4_shroom_data += $random_tick_speed gm4_shroom_data

# trigger spore movement
execute if score $fast_clock gm4_shroom_data matches 6.. run function gm4_shroomites:fast_clock

# reschedule
schedule function gm4_shroomites:main 16t
