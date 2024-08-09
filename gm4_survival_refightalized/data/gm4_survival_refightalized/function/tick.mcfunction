schedule function gm4_survival_refightalized:tick 1t

# check for player damage
execute as @a[advancements={gm4_survival_refightalized:damaged=true}] run function gm4_survival_refightalized:player/health/damaged/run
