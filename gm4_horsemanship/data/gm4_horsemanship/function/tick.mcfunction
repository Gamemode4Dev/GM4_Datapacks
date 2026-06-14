schedule function gm4_horsemanship:tick 1t

# glider
execute as @e[type=#gm4_horsemanship:trainable,tag=gm4_horse.gliding] run function gm4_horsemanship:horse_processing/glider/wing/from_horse
scoreboard players reset @a gm4_horse.horse_one_cm
