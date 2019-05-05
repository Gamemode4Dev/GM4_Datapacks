execute as @e[type=armor_stand,tag=trapped_sign,tag=!trapped_signs_completed] at @s unless block ~ ~ ~ #trapped_signs:signs{Text1:"{\"text\":\"\"}",Text2:"{\"text\":\"\"}",Text3:"{\"text\":\"\"}",Text4:"{\"text\":\"\"}"} run function trapped_signs:complete

execute as @e[type=armor_stand,tag=trapped_sign,tag=trapped_signs_pulsed] at @s run function trapped_signs:deactivate
execute as @e[type=armor_stand,tag=trapped_sign,tag=trapped_signs_need_pulse] at @s run function trapped_signs:activate

execute as @e[type=armor_stand,tag=trapped_sign] at @s unless block ~ ~ ~ #trapped_signs:signs run function trapped_signs:destroy
