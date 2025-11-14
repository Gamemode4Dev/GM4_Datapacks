schedule function gm4_horsemanship:tick 1t

# swim
execute as @e[type=#gm4_horsemanship:trainable,tag=gm4_horse.tamed] at @s run function gm4_horsemanship:horse_processing/swim/process

# glider
execute as @e[type=#gm4_horsemanship:trainable,tag=gm4_horse.gliding] on passengers if entity @s[type=item_display,tag=gm4_horse.glider_wing] run function gm4_horsemanship:horse_processing/glider/wing/update
scoreboard players reset @a gm4_horse.horse_one_cm
