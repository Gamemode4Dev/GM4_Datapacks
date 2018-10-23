#run from seasons:general/clock_second


execute if entity @a[scores={gm4_szn_effect=..1200}] at @a[scores={gm4_szn_effect=..1200}] unless block ~ ~ ~ water align x align z run summon area_effect_cloud ~.5 ~ ~.5 {Tags:[gm4_szn_outside],Duration:1,CustomName:"{\"text\":\"gm4_szn_outside\"}"}

execute if entity @a[tag=gm4_szn_outside] as @e[tag=gm4_szn_outside] at @s unless block ~ ~ ~ water run spreadplayers ~ ~ 0 1 false @s
execute if entity @a[scores={gm4_szn_effect=..1200}] as @a[scores={gm4_szn_effect=..1200}] at @s unless block ~ ~ ~ water if entity @e[tag=gm4_szn_outside,distance=..2] run scoreboard players add @s gm4_szn_effect 1

execute if entity @a[scores={gm4_szn_effect=..1200}] as @a[scores={gm4_szn_effect=..1200}] at @s unless block ~ ~ ~ water if score gm4_szn_detect gm4_szn_daytime matches 100..11000 if entity @e[tag=gm4_szn_outside,distance=..2] run scoreboard players add @s gm4_szn_effect 1

execute if entity @a[scores={gm4_szn_effect=..1200}] run scoreboard players add @a[scores={gm4_szn_effect=..1200}] gm4_szn_effect 1

execute if entity @a[scores={gm4_szn_effect=600..}] as @a[scores={gm4_szn_effect=600..}] run title @s actionbar ["",{"text":"You are thirsty!","color":"red"}]

execute if entity @a[scores={gm4_szn_effect=600..}] as @a[scores={gm4_szn_effect=600..}] run effect give @s weakness 2 0 true
execute if entity @a[scores={gm4_szn_effect=720..}] as @a[scores={gm4_szn_effect=720..}] run effect give @s mining_fatigue 2 0 true
execute if entity @a[scores={gm4_szn_effect=840..}] as @a[scores={gm4_szn_effect=840..}] run effect give @s slowness 2 0 true
execute if entity @a[scores={gm4_szn_effect=900..}] as @a[scores={gm4_szn_effect=900..}] run effect give @s wither 2 0 true

execute if entity @a[scores={gm4_szn_effect=900..}] run advancement grant @a[scores={gm4_szn_effect=900..}] only gm4:thirsty


execute if entity @a[scores={gm4_szn_effect=0..,gm4_szn_drink=1..}] as @a[scores={gm4_szn_effect=0..,gm4_szn_drink=1..}] run scoreboard players remove @s gm4_szn_effect 120
execute if entity @a[scores={gm4_szn_drink=1..}] run scoreboard players reset @a[scores={gm4_szn_drink=1..}] gm4_szn_drink