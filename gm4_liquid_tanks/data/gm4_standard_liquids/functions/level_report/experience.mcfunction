#@s = player looking at tank positioned as tank stand
#run from standard_liquids:level_report_check

#getting value of tank being looked at
scoreboard players operation gm4_lt_report_calc gm4_lt_value = @e[type=marker,tag=gm4_liquid_tank,distance=..0.1,limit=1] gm4_lt_value

#values hardcoded
execute if score gm4_lt_report_calc gm4_lt_value matches 0..6 run title @s actionbar [{"text":"0 / 30  ","color":"dark_green"},{"translate":"text.gm4.liquid_tanks.level_report.levels","fallback":"Levels","color":"dark_green"}]
execute if score gm4_lt_report_calc gm4_lt_value matches 7..15 run title @s actionbar [{"text":"1 / 30  ","color":"dark_green"},{"translate":"text.gm4.liquid_tanks.level_report.levels","fallback":"Levels","color":"dark_green"}]
execute if score gm4_lt_report_calc gm4_lt_value matches 16..26 run title @s actionbar [{"text":"2 / 30  ","color":"dark_green"},{"translate":"text.gm4.liquid_tanks.level_report.levels","fallback":"Levels","color":"dark_green"}]
execute if score gm4_lt_report_calc gm4_lt_value matches 27..39 run title @s actionbar [{"text":"3 / 30  ","color":"dark_green"},{"translate":"text.gm4.liquid_tanks.level_report.levels","fallback":"Levels","color":"dark_green"}]
execute if score gm4_lt_report_calc gm4_lt_value matches 40..54 run title @s actionbar [{"text":"4 / 30  ","color":"dark_green"},{"translate":"text.gm4.liquid_tanks.level_report.levels","fallback":"Levels","color":"dark_green"}]
execute if score gm4_lt_report_calc gm4_lt_value matches 55..71 run title @s actionbar [{"text":"5 / 30  ","color":"dark_green"},{"translate":"text.gm4.liquid_tanks.level_report.levels","fallback":"Levels","color":"dark_green"}]
execute if score gm4_lt_report_calc gm4_lt_value matches 72..90 run title @s actionbar [{"text":"6 / 30  ","color":"dark_green"},{"translate":"text.gm4.liquid_tanks.level_report.levels","fallback":"Levels","color":"dark_green"}]
execute if score gm4_lt_report_calc gm4_lt_value matches 91..111 run title @s actionbar [{"text":"7 / 30  ","color":"dark_green"},{"translate":"text.gm4.liquid_tanks.level_report.levels","fallback":"Levels","color":"dark_green"}]
execute if score gm4_lt_report_calc gm4_lt_value matches 112..134 run title @s actionbar [{"text":"8 / 30  ","color":"dark_green"},{"translate":"text.gm4.liquid_tanks.level_report.levels","fallback":"Levels","color":"dark_green"}]
execute if score gm4_lt_report_calc gm4_lt_value matches 135..159 run title @s actionbar [{"text":"9 / 30  ","color":"dark_green"},{"translate":"text.gm4.liquid_tanks.level_report.levels","fallback":"Levels","color":"dark_green"}]
execute if score gm4_lt_report_calc gm4_lt_value matches 160..186 run title @s actionbar [{"text":"10 / 30  ","color":"dark_green"},{"translate":"text.gm4.liquid_tanks.level_report.levels","fallback":"Levels","color":"dark_green"}]

execute if score gm4_lt_report_calc gm4_lt_value matches 187..215 run title @s actionbar [{"text":"11 / 30  ","color":"dark_green"},{"translate":"text.gm4.liquid_tanks.level_report.levels","fallback":"Levels","color":"dark_green"}]
execute if score gm4_lt_report_calc gm4_lt_value matches 216..246 run title @s actionbar [{"text":"12 / 30  ","color":"dark_green"},{"translate":"text.gm4.liquid_tanks.level_report.levels","fallback":"Levels","color":"dark_green"}]
execute if score gm4_lt_report_calc gm4_lt_value matches 247..279 run title @s actionbar [{"text":"13 / 30  ","color":"dark_green"},{"translate":"text.gm4.liquid_tanks.level_report.levels","fallback":"Levels","color":"dark_green"}]
execute if score gm4_lt_report_calc gm4_lt_value matches 280..314 run title @s actionbar [{"text":"14 / 30  ","color":"dark_green"},{"translate":"text.gm4.liquid_tanks.level_report.levels","fallback":"Levels","color":"dark_green"}]
execute if score gm4_lt_report_calc gm4_lt_value matches 315..351 run title @s actionbar [{"text":"15 / 30  ","color":"dark_green"},{"translate":"text.gm4.liquid_tanks.level_report.levels","fallback":"Levels","color":"dark_green"}]
execute if score gm4_lt_report_calc gm4_lt_value matches 352..393 run title @s actionbar [{"text":"16 / 30  ","color":"dark_green"},{"translate":"text.gm4.liquid_tanks.level_report.levels","fallback":"Levels","color":"dark_green"}]
execute if score gm4_lt_report_calc gm4_lt_value matches 394..440 run title @s actionbar [{"text":"17 / 30  ","color":"dark_green"},{"translate":"text.gm4.liquid_tanks.level_report.levels","fallback":"Levels","color":"dark_green"}]
execute if score gm4_lt_report_calc gm4_lt_value matches 441..492 run title @s actionbar [{"text":"18 / 30  ","color":"dark_green"},{"translate":"text.gm4.liquid_tanks.level_report.levels","fallback":"Levels","color":"dark_green"}]
execute if score gm4_lt_report_calc gm4_lt_value matches 493..549 run title @s actionbar [{"text":"19 / 30  ","color":"dark_green"},{"translate":"text.gm4.liquid_tanks.level_report.levels","fallback":"Levels","color":"dark_green"}]
execute if score gm4_lt_report_calc gm4_lt_value matches 550..611 run title @s actionbar [{"text":"20 / 30  ","color":"dark_green"},{"translate":"text.gm4.liquid_tanks.level_report.levels","fallback":"Levels","color":"dark_green"}]

execute if score gm4_lt_report_calc gm4_lt_value matches 612..678 run title @s actionbar [{"text":"21 / 30  ","color":"dark_green"},{"translate":"text.gm4.liquid_tanks.level_report.levels","fallback":"Levels","color":"dark_green"}]
execute if score gm4_lt_report_calc gm4_lt_value matches 679..750 run title @s actionbar [{"text":"22 / 30  ","color":"dark_green"},{"translate":"text.gm4.liquid_tanks.level_report.levels","fallback":"Levels","color":"dark_green"}]
execute if score gm4_lt_report_calc gm4_lt_value matches 751..827 run title @s actionbar [{"text":"23 / 30  ","color":"dark_green"},{"translate":"text.gm4.liquid_tanks.level_report.levels","fallback":"Levels","color":"dark_green"}]
execute if score gm4_lt_report_calc gm4_lt_value matches 828..909 run title @s actionbar [{"text":"24 / 30  ","color":"dark_green"},{"translate":"text.gm4.liquid_tanks.level_report.levels","fallback":"Levels","color":"dark_green"}]
execute if score gm4_lt_report_calc gm4_lt_value matches 910..996 run title @s actionbar [{"text":"25 / 30  ","color":"dark_green"},{"translate":"text.gm4.liquid_tanks.level_report.levels","fallback":"Levels","color":"dark_green"}]
execute if score gm4_lt_report_calc gm4_lt_value matches 997..1088 run title @s actionbar [{"text":"26 / 30  ","color":"dark_green"},{"translate":"text.gm4.liquid_tanks.level_report.levels","fallback":"Levels","color":"dark_green"}]
execute if score gm4_lt_report_calc gm4_lt_value matches 1089..1185 run title @s actionbar [{"text":"27 / 30  ","color":"dark_green"},{"translate":"text.gm4.liquid_tanks.level_report.levels","fallback":"Levels","color":"dark_green"}]
execute if score gm4_lt_report_calc gm4_lt_value matches 1186..1287 run title @s actionbar [{"text":"28 / 30  ","color":"dark_green"},{"translate":"text.gm4.liquid_tanks.level_report.levels","fallback":"Levels","color":"dark_green"}]
execute if score gm4_lt_report_calc gm4_lt_value matches 1288..1394 run title @s actionbar [{"text":"29 / 30  ","color":"dark_green"},{"translate":"text.gm4.liquid_tanks.level_report.levels","fallback":"Levels","color":"dark_green"}]
execute if score gm4_lt_report_calc gm4_lt_value matches 1395.. run title @s actionbar [{"text":"30 / 30  ","color":"dark_green"},{"translate":"text.gm4.liquid_tanks.level_report.levels","fallback":"Levels","color":"dark_green"}]


scoreboard players reset gm4_lt_report_calc gm4_lt_value
tag @s add gm4_lt_found_tank
