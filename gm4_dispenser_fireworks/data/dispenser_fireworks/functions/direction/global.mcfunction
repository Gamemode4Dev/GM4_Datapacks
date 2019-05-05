#global commands for all directions
#@s - @e[type=minecraft:firework_rocket,tag=!gm4_df_modified] with dispenser checks succeeded
#called by dispenser_fireworks:direction/<direction>

#set angle tag
data merge entity @s {ShotAtAngle:1b}

#add to score
scoreboard players add @s gm4_df_mod_count 1
