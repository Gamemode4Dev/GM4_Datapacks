#runs every tick
scoreboard players add current_tick gm4_clock_tick 1
execute if score current_tick gm4_clock_tick matches 16.. run scoreboard players set current_tick gm4_clock_tick 0
function #gm4:pulse_check
