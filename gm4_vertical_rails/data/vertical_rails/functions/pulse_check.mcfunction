#compares assigned run tick to current tick and calls main
execute if score current_tick gm4_clock_tick = vertical_rails gm4_clock_tick run function vertical_rails:main
execute as @e[type=#gm4:minecart] at @s if block ~ ~ ~ ladder run function vertical_rails:momentum
