# restore absorption hearts cap
# @s = unspecified
# at unspecified
# schedule from player/health/damaged/eval_absorption_reduction

execute as @a[scores={gm4_sr_absorp_reduced_timer=1}] run attribute @s generic.max_absorption modifier remove gm4_sr_absorption_reduced
scoreboard players remove @a[scores={gm4_sr_absorp_reduced_timer=1..}] gm4_sr_absorp_reduced_timer 1

execute if entity @a[scores={gm4_sr_absorp_reduced_timer=1..}] run schedule function gm4_survival_refightalized:player/health/damaged/restore_absorption_clock 1t