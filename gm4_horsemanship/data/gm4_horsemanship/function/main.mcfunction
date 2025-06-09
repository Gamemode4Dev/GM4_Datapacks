schedule function gm4_horsemanship:main 16t

# horse processing
execute as @e[type=#gm4_horsemanship:trainable,tag=gm4_horse] at @s run function gm4_horsemanship:horse_processing/general
scoreboard players reset @a gm4_horse_riding

# horse grazing
execute as @e[type=#gm4_horsemanship:trainable,tag=!gm4_horse.grazing,nbt={EatingHaystack:1b}] run function gm4_horsemanship:need/graze/start

# TEMP DEV COMMAND - TODO: remove
execute as @a[tag=gm4_horse_dev] at @s as @e[type=#gm4_horsemanship:trainable,limit=1,sort=nearest] run title @p[tag=gm4_horse_dev] actionbar [{"text":"Lvl: ","color":"gray"},{"score":{"name":"@s","objective":"gm4_horse_level"},"color":"white"},{"text":" | XP: "},{"score":{"name":"@s","objective":"gm4_horse_experience"},"color":"white"},{"text":" (","color":"dark_gray"},{"score":{"name":"@s","objective":"gm4_horse_comfort"},"color":"dark_gray"},{"text":"%)","color":"dark_gray"},{"text":" | Graze: "},{"score":{"name":"@s","objective":"gm4_horse_need.graze"},"color":"white"},{"text":"/1800 | Social: "},{"score":{"name":"@s","objective":"gm4_horse_need.social"},"color":"white"},{"text":"/2250 | Brush: "},{"score":{"name":"@s","objective":"gm4_horse_need.brushing"},"color":"white"},{"text":"/750 | Stamina: "},{"score":{"name":"@s","objective":"gm4_horse_need.stamina"},"color":"white"},{"text":"/"},{"score":{"name":"@s","objective":"gm4_horse.stamina_cap"}}]
