schedule function gm4_horsemanship:main 16t

# init new horses
execute as @e[type=#gm4_horsemanship:trainable,tag=!gm4_horse,tag=!smithed.entity] run function gm4_horsemanship:level/init_horse

# horse processing
execute as @e[type=#gm4_horsemanship:trainable,tag=gm4_horse.tamed] at @s run function gm4_horsemanship:horse_processing/general

# horse grazing
execute as @e[type=#gm4_horsemanship:trainable,tag=gm4_horse,tag=!gm4_horse.grazing,nbt={EatingHaystack:1b}] run function gm4_horsemanship:horse_processing/graze/start


# dev log
execute as @a[tag=gm4_horse_dev] at @s as @e[type=#gm4_horsemanship:trainable,limit=1,sort=nearest] run title @p actionbar [{text:"| Tracked Horse: "},{selector:"@s"},{text:" Stamina: ","color":"gray"},{"score":{"name":"@s","objective":"gm4_horse.stamina"},"color":"white"},{text:"/"},{"score":{"name":"@s","objective":"gm4_horse.stamina_cap"}},{text:" XP: ","color":"gray"},{"score":{"name":"@s","objective":"gm4_horse.experience_to_level"},"color":"white"},{"text":" |"}]
