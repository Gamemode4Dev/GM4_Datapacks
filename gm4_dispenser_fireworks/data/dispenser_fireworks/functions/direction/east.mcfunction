#sets direction
#@s - @e[type=minecraft:firework_rocket,tag=!gm4_df_modified] with dispenser checks succeeded
#called by dispenser_fireworks:direction/check_block

#set motion
data merge entity @s {Motion:[0.5299999999999999d,0.0d,0.0d]}

#global processes
function dispenser_fireworks:direction/global
