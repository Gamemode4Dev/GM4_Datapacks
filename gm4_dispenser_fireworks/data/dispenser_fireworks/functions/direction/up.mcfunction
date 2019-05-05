#sets direction
#@s - @e[type=minecraft:firework_rocket,tag=!gm4_df_modified] with dispenser checks succeeded
#called by dispenser_fireworks:direction/check_block

#remove angle tag
data merge entity @s {ShotAtAngle:0b}

#add ignore tag as fireworks automatically go up
tag @s add gm4_df_ignore
