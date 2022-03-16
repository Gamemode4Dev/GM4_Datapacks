# scans downward breaking floating ladders as it goes
# @s = ladder item that was broken by player
# align xyz positioned ~.5 ~-1 ~.5, moving downward
# run from gm4_rope_ladders:mechanics/break_floating_ladders/scan_column/init

# reset scoreboard
scoreboard players set $ladder_broken gm4_rol_data 0

# detect if ladder can be broken
execute if block ~ ~ ~ ladder[facing=east] unless block ~-1 ~ ~ #gm4:full_collision run function gm4_rope_ladders:mechanics/break_floating_ladders/break_ladder
execute if block ~ ~ ~ ladder[facing=west] unless block ~1 ~ ~ #gm4:full_collision run function gm4_rope_ladders:mechanics/break_floating_ladders/break_ladder
execute if block ~ ~ ~ ladder[facing=south] unless block ~ ~ ~-1 #gm4:full_collision run function gm4_rope_ladders:mechanics/break_floating_ladders/break_ladder
execute if block ~ ~ ~ ladder[facing=north] unless block ~ ~ ~1 #gm4:full_collision run function gm4_rope_ladders:mechanics/break_floating_ladders/break_ladder

# loop
scoreboard players add $loop gm4_rol_data 1
execute if score $loop gm4_rol_data matches 0..511 unless score $ladder_broken gm4_rol_data matches 0 if block ~ ~-1 ~ ladder positioned ~ ~-1 ~ run function gm4_rope_ladders:mechanics/break_floating_ladders/scan_column/loop
