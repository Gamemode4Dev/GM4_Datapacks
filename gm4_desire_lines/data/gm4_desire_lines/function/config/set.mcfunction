$scoreboard players set #temp gm4_desire_lines $(id)

execute if score #temp gm4_desire_lines matches 1 run scoreboard players set ?break_flowers gm4_desire_lines 0
execute if score #temp gm4_desire_lines matches 2 run scoreboard players set ?break_flowers gm4_desire_lines 1
execute if score #temp gm4_desire_lines matches 3 run scoreboard players set ?break_grass gm4_desire_lines 0
execute if score #temp gm4_desire_lines matches 4 run scoreboard players set ?break_grass gm4_desire_lines 1

function gm4_desire_lines:config

scoreboard players reset #temp gm4_desire_lines
