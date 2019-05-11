# @s = trapped sign
# run from main

execute if entity @s[tag=!gm4_trapped_signs_completed] at @s unless block ~ ~ ~ #minecraft:signs{Text1:"{\"text\":\"\"}",Text2:"{\"text\":\"\"}",Text3:"{\"text\":\"\"}",Text4:"{\"text\":\"\"}"} run function trapped_signs:complete

execute if entity @s[tag=gm4_trapped_signs_pulsed] at @s run function trapped_signs:deactivate
execute if entity @s[tag=gm4_trapped_signs_need_pulse] at @s run function trapped_signs:activate

execute unless block ~ ~ ~ #minecraft:signs run function trapped_signs:destroy
