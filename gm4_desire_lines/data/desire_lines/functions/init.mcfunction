scoreboard objectives add gm4_dl_random dummy
scoreboard objectives add gm4_desire_lines minecraft.custom:minecraft.walk_one_cm
scoreboard objectives add gm4_dl_sprint minecraft.custom:minecraft.sprint_one_cm
scoreboard objectives add gm4_dl_affcoarse dummy

scoreboard players set desire_lines gm4_modules 1

execute unless score desire_lines gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Desire Lines"}

schedule function desire_lines:tick 1t

#$moduleUpdateList
