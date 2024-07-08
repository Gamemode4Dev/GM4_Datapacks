
execute as @a[scores={gm4_ae_absorp_reduced_timer=1}] run attribute @s generic.max_absorption modifier remove gm4_ae_absorption_reduced
scoreboard players remove @a[scores={gm4_ae_absorp_reduced_timer=1..}] gm4_ae_absorp_reduced_timer 1

execute if entity @a[scores={gm4_ae_absorp_reduced_timer=1..}] run schedule function gm4_armor_expanded:clocks/temp/restore_absorption 1t
