# tick down arrow fire delay
# @s = entity that shot an arrow
# at unspecified
# run from main

scoreboard players remove @s gm4_sr_arrow.fire_delay_left 1
attribute @s[scores={gm4_sr_arrow.fire_delay_left=0}] generic.follow_range modifier remove gm4_survival_refightalized:arrow_fire_delay
