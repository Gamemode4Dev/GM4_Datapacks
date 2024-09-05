# buff all mobs near an enderman
execute at @e[type=enderman,tag=!smithed.entity,tag=!gm4_no_esc] as @e[type=#gm4_enderman_support_class:affected,distance=..25,tag=!smithed.entity,tag=!gm4_no_esc] run function gm4_enderman_support_class:buff

schedule function gm4_enderman_support_class:main 16t
