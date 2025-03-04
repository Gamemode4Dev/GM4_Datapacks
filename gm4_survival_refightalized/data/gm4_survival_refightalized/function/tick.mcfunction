schedule function gm4_survival_refightalized:tick 1t

# check for player damage
execute as @a[advancements={gm4_survival_refightalized:damaged=true}] at @s run function gm4_survival_refightalized:player/damage/run

# check for projectiles
execute as @e[type=#gm4_survival_refightalized:arrow,tag=!gm4_sr_arrow_checked,tag=!smithed.strict,tag=!smithed.entity] run function gm4_survival_refightalized:check_arrow

# shield parry
execute as @a[scores={gm4_sr_shield.timer=1}] run function gm4_survival_refightalized:player/damage/shield/remove_using
scoreboard players remove @a[scores={gm4_sr_shield.timer=1..}] gm4_sr_shield.timer 1
