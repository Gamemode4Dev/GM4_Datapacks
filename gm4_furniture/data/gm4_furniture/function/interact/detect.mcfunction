# detect interacting (right-click) on furniture
# @s = player interacting with furniture
# at @s
advancement revoke @s only gm4_furniture:interact_with_furniture

# item data
# | candle lighting
execute store result score $mainhand_candle_igniter gm4_furniture_data store result score $offhand_candle_igniter gm4_furniture_data run scoreboard players set $holding_lighter gm4_furniture_data 0
execute if items entity @s weapon.mainhand #gm4_furniture:candle_igniters store result score $holding_lighter gm4_furniture_data run scoreboard players set $mainhand_candle_igniter gm4_furniture_data 1
execute unless score $mainhand_candle_igniter gm4_furniture_data matches 1 if items entity @s weapon.offhand #gm4_furniture:candle_igniters store result score $holding_lighter gm4_furniture_data run scoreboard players set $offhand_candle_igniter gm4_furniture_data 1

# find interaction entity that was interacted with
tag @s add gm4_furniture_target
execute as @e[type=interaction,tag=gm4_furniture,distance=..8] if data entity @s interaction at @s run function gm4_furniture:interact/process
tag @s remove gm4_furniture_target

# item use interactions
execute if score $ignited_candle gm4_furniture_data matches 1 run function gm4_furniture:interact/custom/furniture/misc/candle/find_igniter
