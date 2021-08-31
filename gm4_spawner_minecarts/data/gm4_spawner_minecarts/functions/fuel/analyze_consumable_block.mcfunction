# @s = flower_checker area_effect_cloud
# at @s
# run from spawner_minecarts:fuel/check_for_consumable_block

# add fuel if block was a flower
execute at @s if block ~ ~ ~ #minecraft:small_flowers run function gm4_spawner_minecarts:fuel/consume_flower

# destroy target block
execute if block ~ ~ ~ minecraft:tall_grass run scoreboard players set $found_tall_grass gm4_spawner_data 1
setblock ~ ~ ~ air replace

# break tall grass silently
execute if score $found_tall_grass gm4_spawner_data matches 1.. run stopsound @a[distance=..16] block minecraft:block.grass.break
scoreboard players reset $found_tall_grass gm4_spawner_data

# visuals and sounds
playsound entity.turtle.egg_break block @a[distance=..8] ~ ~ ~ 0.3 1.4
particle block seagrass ~ ~.2 ~ 0 0 0 0 7

