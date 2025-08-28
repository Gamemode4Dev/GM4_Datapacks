# detect interacting (right-click) on furniture
# @s = player interacting with furniture
# at @s
advancement revoke @s only gm4_furniture:interact_with_furniture

# player data for further interactions
execute store success score $holding_lighter gm4_furniture_data if items entity @s weapon.mainhand #minecraft:creeper_igniters
scoreboard players reset $ignited_candle gm4_furniture_data

# find interaction entity that was interacted with
tag @s add gm4_furniture_target
execute as @e[type=interaction,tag=gm4_furniture,distance=..8] if data entity @s interaction at @s run function gm4_furniture:interact/process
tag @s remove gm4_furniture_target

# return if didnt ignite candle
execute unless score $ignited_candle gm4_furniture_data matches 1 run return fail

# item used to ignite candle (fire charge or flint and steel)
execute if items entity @s weapon.mainhand fire_charge run return \
  run function gm4_furniture:interact/custom/furniture/misc/candle/used_fire_charge
function gm4_furniture:interact/custom/furniture/misc/candle/used_flint_and_steel
