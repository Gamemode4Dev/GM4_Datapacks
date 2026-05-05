#@s = player looking at tank positioned as tank stand
#run from standard_liquids:level_report_check

#getting value of tank being looked at
scoreboard players operation gm4_lt_report_calc gm4_lt_value = @e[type=marker,tag=gm4_liquid_tank,distance=..0.1,limit=1] gm4_lt_value

#values hardcoded
# 0-15 formula
prior_points = 0
for lvl in range(1,52):
    if lvl <= 16:
        current_points = lvl**2 + 6*lvl
    elif lvl <= 31:
        current_points = 2.5*lvl**2 - 40.5*lvl + 360
    else:
        current_points = 4.5*lvl**2 - 162.5*lvl + 2220
    execute if score gm4_lt_report_calc gm4_lt_value matches (int(prior_points), int(current_points-1)) run title @s actionbar [{"text":f"{lvl-1} / 50  ","color":"dark_green"},{"translate":"text.gm4.liquid_tanks.level_report.levels","fallback":"Levels","color":"dark_green"}]
    prior_points = current_points

scoreboard players reset gm4_lt_report_calc gm4_lt_value
tag @s add gm4_lt_found_tank
