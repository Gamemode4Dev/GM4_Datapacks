# check feeding the gm4_horse an actual food item
# @s = player feeding the gm4_horse
# at @s
# run from advancement feed_horse

# check nearby horses to find the one that was fed
tag @s add gm4_horse_check_player
execute as @e[type=#gm4_horsemanship:trainable,distance=..8] run function gm4_horsemanship:need/food/check_horse
tag @s remove gm4_horse_check_player

# check advancement criteria to find used food item
scoreboard players set $food_processed gm4_horse_data 0
execute if score $food_processed gm4_horse_data matches 0 if entity @s[advancements={gm4_horsemanship:feed_horse={apple=true}}] as @e[type=#gm4_horsemanship:trainable,tag=gm4_horse_target,distance=..8,limit=1] at @s run function gm4_horsemanship:need/food/type/apple
execute if score $food_processed gm4_horse_data matches 0 if entity @s[advancements={gm4_horsemanship:feed_horse={golden_apple=true}}] as @e[type=#gm4_horsemanship:trainable,tag=gm4_horse_target,distance=..8,limit=1] at @s run function gm4_horsemanship:need/food/type/golden_apple
execute if score $food_processed gm4_horse_data matches 0 if entity @s[advancements={gm4_horsemanship:feed_horse={enchanted_golden_apple=true}}] as @e[type=#gm4_horsemanship:trainable,tag=gm4_horse_target,distance=..8,limit=1] at @s run function gm4_horsemanship:need/food/type/enchanted_golden_apple
execute if score $food_processed gm4_horse_data matches 0 if entity @s[advancements={gm4_horsemanship:feed_horse={carrot=true}}] as @e[type=#gm4_horsemanship:trainable,tag=gm4_horse_target,distance=..8,limit=1] at @s run function gm4_horsemanship:need/food/type/carrot
execute if score $food_processed gm4_horse_data matches 0 if entity @s[advancements={gm4_horsemanship:feed_horse={golden_carrot=true}}] as @e[type=#gm4_horsemanship:trainable,tag=gm4_horse_target,distance=..8,limit=1] at @s run function gm4_horsemanship:need/food/type/golden_carrot
execute if score $food_processed gm4_horse_data matches 0 if entity @s[advancements={gm4_horsemanship:feed_horse={sugar=true}}] as @e[type=#gm4_horsemanship:trainable,tag=gm4_horse_target,distance=..8,limit=1] at @s run function gm4_horsemanship:need/food/type/sugar
execute if score $food_processed gm4_horse_data matches 0 if entity @s[advancements={gm4_horsemanship:feed_horse={wheat=true}}] as @e[type=#gm4_horsemanship:trainable,tag=gm4_horse_target,distance=..8,limit=1] at @s run function gm4_horsemanship:need/food/type/wheat
execute if score $food_processed gm4_horse_data matches 0 if entity @s[advancements={gm4_horsemanship:feed_horse={hay_block=true}}] as @e[type=#gm4_horsemanship:trainable,tag=gm4_horse_target,distance=..8,limit=1] at @s run function gm4_horsemanship:need/food/type/hay_block
advancement revoke @s only gm4_horsemanship:feed_horse
