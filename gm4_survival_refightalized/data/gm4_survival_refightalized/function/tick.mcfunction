schedule function gm4_survival_refightalized:tick 1t

# check for player damage
execute as @a[advancements={gm4_survival_refightalized:damaged=true}] at @s run function gm4_survival_refightalized:player/health/damaged/run

# check for projectiles
execute as @e[type=#gm4_survival_refightalized:damaging_projectile,tag=!gm4_sr_arrow_checked,tag=!smithed.strict,tag=!smithed.entity] run function gm4_survival_refightalized:check_arrow
