# @s = @a[tag=gm4_on_pig,tag=gm4_has_hoe]
# Called from pulse_check

# Check Crop
function pig_tractors:check_crop

# Break crop
execute if block ~ ~ ~ #pig_tractors:crop_age7[age=7] run function pig_tractors:break_crop
execute if block ~ ~ ~ minecraft:beetroots[age=3] run function pig_tractors:break_crop

# Place crop
execute if block ~ ~ ~ air if block ~ ~-0.7 ~ farmland if score @s gm4_sel_crop matches 1..4 run function pig_tractors:place_crop
