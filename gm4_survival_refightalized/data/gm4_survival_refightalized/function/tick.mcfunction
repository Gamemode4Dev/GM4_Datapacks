schedule function gm4_survival_refightalized:tick 1t

# check for player damage
execute as @a[advancements={gm4_survival_refightalized:damaged=true}] run function gm4_survival_refightalized:player/health/damaged/run

# check for arrows
execute as @e[type=arrow,tag=!gm4_sr_arrow_checked,tag=!smithed.strict,tag=!smithed.entity] run function gm4_survival_refightalized:check_arrow
