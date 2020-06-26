team add gm4_afk
team modify gm4_afk prefix ["",{"text":"[AFK] ","color":"gray"}]

scoreboard objectives add gm4_afk_leave minecraft.custom:minecraft.leave_game
scoreboard objectives add gm4_afk_still dummy
scoreboard objectives add gm4_afk_count dummy
scoreboard objectives add gm4_afk_total dummy

scoreboard objectives add gm4_afk_x dummy
scoreboard objectives add gm4_afk_y dummy
scoreboard objectives add gm4_afk_z dummy
scoreboard objectives add gm4_afk_x1 dummy
scoreboard objectives add gm4_afk_y1 dummy
scoreboard objectives add gm4_afk_z1 dummy

function gm4_afk_detector:init_team

execute as @a[gamemode=!spectator] run function gm4_afk_detector:check_pos

execute unless score afk_detector gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"AFK Detector"}
scoreboard players set afk_detector gm4_modules 1

schedule function gm4_afk_detector:clock 20t

#$moduleUpdateList
