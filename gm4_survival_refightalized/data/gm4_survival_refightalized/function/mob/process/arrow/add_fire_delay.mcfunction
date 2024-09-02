# add arrow fire delay
# @s = entity that shot an arrow
# at unspecified
# run from mob/process/arrow/run

scoreboard players operation @s gm4_sr_proj_fire_delay_left = @s gm4_sr_proj_fire_delay
attribute @s[scores={gm4_sr_proj_fire_delay_left=1..}] generic.follow_range modifier add gm4_survival_refightalized:arrow_fire_delay -1 add_multiplied_total
