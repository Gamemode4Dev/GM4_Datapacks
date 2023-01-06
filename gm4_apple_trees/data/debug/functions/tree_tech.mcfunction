place template debug:trunk ~ ~ ~
execute if block ~ ~ ~ command_block run say command_block still exists!
setblock ~ ~ ~ dark_oak_log

execute as @e[tag=leaf_marker,distance=..3] at @s run place template debug:leaf ~ ~ ~