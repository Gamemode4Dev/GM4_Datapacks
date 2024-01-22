# get the color of the broken furnitur
# @s = furniture main interaction entity
# at @s
# run from break/process_hit

# find this furniture's item_display and get its color
scoreboard players operation $check_id gm4_furniture_id = @s gm4_furniture_id
execute as @e[type=item_display,tag=gm4_furniture.display,distance=..8] if score @s gm4_furniture_id = $check_id gm4_furniture_id store result storage gm4_furniture:temp color int 1 run data get entity @s item.tag.display.color

item modify entity @p[tag=gm4_furniture_target] weapon.mainhand gm4_furniture:get_color
playsound item.dye.use player @a[distance=..8] ~ ~ ~ 1 1.15

scoreboard players set $color_picked gm4_furniture_data 1
