scoreboard players operation @s heart_can_time -= @s heart_can_health
scoreboard players set @s[scores={heart_can_time=0}] heart_can_time 1337
effect clear @s[scores={heart_can_time=..1336}] health_boost
effect give @s[scores={heart_can_time=..1336,heart_can_health=1}] health_boost 1000000 0 true
effect give @s[scores={heart_can_time=..1336,heart_can_health=2}] health_boost 1000000 1 true
effect give @s[scores={heart_can_time=..1336,heart_can_health=3}] health_boost 1000000 2 true
effect give @s[scores={heart_can_time=..1336,heart_can_health=4}] health_boost 1000000 3 true
effect give @s[scores={heart_can_time=..1336,heart_can_health=5}] health_boost 1000000 4 true
effect give @s[scores={heart_can_time=..1336,heart_can_health=6}] health_boost 1000000 5 true
effect give @s[scores={heart_can_time=..1336,heart_can_health=7}] health_boost 1000000 6 true
effect give @s[scores={heart_can_time=..1336,heart_can_health=8}] health_boost 1000000 7 true
effect give @s[scores={heart_can_time=..1336,heart_can_health=9}] health_boost 1000000 8 true
effect give @s[scores={heart_can_time=..1336,heart_can_health=10}] health_boost 1000000 9 true
scoreboard players operation @s heart_can_time = @s heart_can_health
