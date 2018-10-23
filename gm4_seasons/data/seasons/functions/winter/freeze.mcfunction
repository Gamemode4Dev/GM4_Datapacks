#run from seasons:general/clock_second


execute at @a[scores={gm4_szn_effect=..1200}] align x align z run summon area_effect_cloud ~.5 ~ ~.5 {Tags:[gm4_szn_outside],Duration:1,CustomName:"{\"text\":\"gm4_szn_outside\"}"}

execute as @e[tag=gm4_szn_outside] at @s run spreadplayers ~ ~ 0 1 false @s

execute if score gm4_szn_duration gm4_szn_weather matches 1.. if score gm4_szn_type gm4_szn_weather matches 2 as @a[scores={gm4_szn_effect=..1200}] at @s if entity @e[tag=gm4_szn_outside,distance=..2] run scoreboard players add @s gm4_szn_effect 2

execute if score gm4_szn_duration gm4_szn_weather matches 1.. if score gm4_szn_type gm4_szn_weather matches 0 as @a[scores={gm4_szn_effect=..1200}] at @s if entity @e[tag=gm4_szn_outside,distance=..2] run scoreboard players add @s gm4_szn_effect 2

execute if entity @a[scores={gm4_szn_effect=..1200}] as @a[scores={gm4_szn_effect=..1200}] at @s if entity @e[tag=gm4_szn_outside,distance=..2] run scoreboard players add @s gm4_szn_effect 1

execute if entity @a[scores={gm4_szn_effect=..1200}] as @a[scores={gm4_szn_effect=..1200}] at @s if score gm4_szn_detect gm4_szn_daytime matches 13000..23000 run scoreboard players add @s gm4_szn_effect 1

execute if entity @a[scores={gm4_szn_effect=..1200}] as @a[scores={gm4_szn_effect=..1200}] at @s if score gm4_szn_detect gm4_szn_daytime matches 13000..22000 if entity @e[tag=gm4_szn_outside,distance=..2] run scoreboard players add @s gm4_szn_effect 1

execute if entity @a[scores={gm4_szn_effect=..1200}] run scoreboard players add @a[scores={gm4_szn_effect=..1200}] gm4_szn_effect 1

execute if entity @a[scores={gm4_szn_effect=600..}] as @a[scores={gm4_szn_effect=600..}] run title @s actionbar ["",{"text":"You are cold!","color":"blue"}]

execute if entity @a[scores={gm4_szn_effect=600..}] as @a[scores={gm4_szn_effect=600..}] run effect give @s slowness 2 0 true
execute if entity @a[scores={gm4_szn_effect=720..}] as @a[scores={gm4_szn_effect=720..}] run effect give @s weakness 2 0 true
execute if entity @a[scores={gm4_szn_effect=840..}] as @a[scores={gm4_szn_effect=840..}] run effect give @s mining_fatigue 2 0 true
execute if entity @a[scores={gm4_szn_effect=900..}] as @a[scores={gm4_szn_effect=900..}] run effect give @s wither 2 0 true

execute if entity @a[scores={gm4_szn_effect=900..}] run advancement grant @a[scores={gm4_szn_effect=900..}] only gm4:frost_bite


execute if entity @a[scores={gm4_szn_effect=0..}] as @a[scores={gm4_szn_effect=0..}] at @s store result score @s gm4_szn_warmth run clone ~-3 ~-2 ~-3 ~3 ~3 ~3 ~-3 ~-2 ~-3 filtered #seasons:warmth force
execute if entity @a[scores={gm4_szn_effect=0..}] as @a[scores={gm4_szn_effect=0..}] run scoreboard players operation @s gm4_szn_warmth *= 2 gm4_szn_warmth
execute if entity @a[scores={gm4_szn_effect=0..}] as @a[scores={gm4_szn_effect=0..}] run scoreboard players operation @s gm4_szn_effect -= @s gm4_szn_warmth


execute if entity @a[scores={gm4_szn_effect=0..}] as @a[scores={gm4_szn_effect=0..},nbt={Inventory:[{Slot:102b,id:"minecraft:leather_chestplate"}]}] run scoreboard players remove @s gm4_szn_effect 3