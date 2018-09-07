scoreboard players operation @s gm4_heart_prev -= @s gm4_heart_can
scoreboard players set @s[scores={gm4_heart_prev=0}] gm4_heart_prev 1337
effect clear @s[scores={gm4_heart_prev=..1336}] health_boost
effect give @s[scores={gm4_heart_prev=..1336,gm4_heart_can=1}] health_boost 1000000 0 true
effect give @s[scores={gm4_heart_prev=..1336,gm4_heart_can=2}] health_boost 1000000 1 true
effect give @s[scores={gm4_heart_prev=..1336,gm4_heart_can=3}] health_boost 1000000 2 true
effect give @s[scores={gm4_heart_prev=..1336,gm4_heart_can=4}] health_boost 1000000 3 true
effect give @s[scores={gm4_heart_prev=..1336,gm4_heart_can=5}] health_boost 1000000 4 true
effect give @s[scores={gm4_heart_prev=..1336,gm4_heart_can=6}] health_boost 1000000 5 true
effect give @s[scores={gm4_heart_prev=..1336,gm4_heart_can=7}] health_boost 1000000 6 true
effect give @s[scores={gm4_heart_prev=..1336,gm4_heart_can=8}] health_boost 1000000 7 true
effect give @s[scores={gm4_heart_prev=..1336,gm4_heart_can=9}] health_boost 1000000 8 true
effect give @s[scores={gm4_heart_prev=..1336,gm4_heart_can=10}] health_boost 1000000 9 true
scoreboard players operation @s gm4_heart_prev = @s gm4_heart_can
