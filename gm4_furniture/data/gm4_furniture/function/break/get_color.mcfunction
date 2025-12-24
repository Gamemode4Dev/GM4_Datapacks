# get the color of the broken furnitur
# @s = furniture main interaction entity
# at @s
# run from break/process_hit

# find this furniture's item_display and get its color
scoreboard players operation $check_id gm4_furniture_id = @s gm4_furniture_id
execute as @e[type=item_display,tag=gm4_furniture.display,distance=..8] if score @s gm4_furniture_id = $check_id gm4_furniture_id store result storage gm4_furniture:temp color.rgb int 1 run data get entity @s item.components."minecraft:dyed_color"
function gm4_furniture:break/eval_color with storage gm4_furniture:temp color
data remove storage gm4_furniture:temp color
playsound item.dye.use player @a[distance=..8] ~ ~ ~ 1 1.15
