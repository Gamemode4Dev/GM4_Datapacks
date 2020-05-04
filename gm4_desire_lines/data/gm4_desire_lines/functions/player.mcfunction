#@s=@a[gamemode=!spectator,gamemode=!creative]
#run by main

scoreboard players operation @s gm4_desire_lines += @s gm4_dl_sprint
scoreboard players set @s gm4_dl_sprint 0
execute if score @s gm4_desire_lines matches 30.. run scoreboard players set @s gm4_desire_lines 19
execute if score @s gm4_desire_lines matches 1.. run scoreboard players remove @s gm4_desire_lines 20

function #gm4_desire_lines:expansion
execute if predicate gm4_desire_lines:has_slow_falling run scoreboard players set @s gm4_desire_lines 0
execute if score desire_lines gm4_dl_random matches ..2 if score @s gm4_desire_lines matches 1.. positioned ~ ~ ~ run function gm4_desire_lines:path
