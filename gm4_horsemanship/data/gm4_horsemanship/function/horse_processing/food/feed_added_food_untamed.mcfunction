# check feeding the gm4_horse a food item added by this module
# @s = player feeding the gm4_horse
# at @s
# run from advancement feed_untamed_horse

# check nearby horses to find the one that was fed
tag @s add gm4_horse_check_player
execute as @e[type=#gm4_horsemanship:trainable,distance=..8] run function gm4_horsemanship:horse_processing/food/check_horse
tag @s remove gm4_horse_check_player

## NOTE: Short Grass is not included in this list as it does not increase Temper (similar to Hay Bales)

# check advancement criteria to find used food item
scoreboard players set $food_processed gm4_horse_data 0
execute if score $food_processed gm4_horse_data matches 0 if entity @s[advancements={gm4_horsemanship:feed_untamed_horse={baked_potato=true}}] as @e[type=#gm4_horsemanship:trainable,tag=gm4_horse_target,distance=..8,limit=1] run function gm4_horsemanship:horse_processing/food/type/baked_potato
execute if score $food_processed gm4_horse_data matches 0 if entity @s[advancements={gm4_horsemanship:feed_untamed_horse={beetroot=true}}] as @e[type=#gm4_horsemanship:trainable,tag=gm4_horse_target,distance=..8,limit=1] run function gm4_horsemanship:horse_processing/food/type/beetroot
execute if score $food_processed gm4_horse_data matches 0 if entity @s[advancements={gm4_horsemanship:feed_untamed_horse={bread=true}}] as @e[type=#gm4_horsemanship:trainable,tag=gm4_horse_target,distance=..8,limit=1] run function gm4_horsemanship:horse_processing/food/type/bread
execute if score $food_processed gm4_horse_data matches 0 if entity @s[advancements={gm4_horsemanship:feed_untamed_horse={chorus_fruit=true}}] as @e[type=#gm4_horsemanship:trainable,tag=gm4_horse_target,distance=..8,limit=1] run function gm4_horsemanship:horse_processing/food/type/chorus_fruit
execute if score $food_processed gm4_horse_data matches 0 if entity @s[advancements={gm4_horsemanship:feed_untamed_horse={dried_kelp=true}}] as @e[type=#gm4_horsemanship:trainable,tag=gm4_horse_target,distance=..8,limit=1] run function gm4_horsemanship:horse_processing/food/type/dried_kelp
execute if score $food_processed gm4_horse_data matches 0 if entity @s[advancements={gm4_horsemanship:feed_untamed_horse={glow_berries=true}}] as @e[type=#gm4_horsemanship:trainable,tag=gm4_horse_target,distance=..8,limit=1] run function gm4_horsemanship:horse_processing/food/type/glow_berries
execute if score $food_processed gm4_horse_data matches 0 if entity @s[advancements={gm4_horsemanship:feed_untamed_horse={melon_slice=true}}] as @e[type=#gm4_horsemanship:trainable,tag=gm4_horse_target,distance=..8,limit=1] run function gm4_horsemanship:horse_processing/food/type/melon_slice
execute if score $food_processed gm4_horse_data matches 0 if entity @s[advancements={gm4_horsemanship:feed_untamed_horse={sweet_berries=true}}] as @e[type=#gm4_horsemanship:trainable,tag=gm4_horse_target,distance=..8,limit=1] run function gm4_horsemanship:horse_processing/food/type/sweet_berries
advancement revoke @s only gm4_horsemanship:feed_untamed_horse

# playsound and remove the fed item
execute at @e[type=#gm4_horsemanship:trainable,tag=gm4_horse_target,distance=..8,limit=1] run playsound entity.horse.eat neutral @a ~ ~ ~ 1 1
item modify entity @s[gamemode=!creative] weapon.mainhand {"function": "minecraft:set_count","count":-1,"add":true}
