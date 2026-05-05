#@s = liquid minecart
#run from try_to_unload

#summon item_display
summon item_display ~ ~ ~ {CustomName:"gm4_liquid_tank_liquid_display",Tags:["gm4_liquid_tank_liquid_display","smithed.entity","smithed.strict","gm4_lm_needs_texture"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation: [0f,0f,0f,1f],translation:[0f,0.2185f,0f],scale:[0.83,0.83,0.83]},item_display:head}
data modify entity @e[type=item_display,tag=gm4_lm_needs_texture,limit=1,sort=nearest] item set from entity @s Passengers[0].item.components."minecraft:custom_data".gm4_liquid_minecarts.tank.texture
data modify entity @e[type=marker,tag=gm4_liquid_tank,limit=1,sort=nearest,distance=..0.1] data.gm4_liquid_tanks.liquid_tag set from entity @s Passengers[0].item.components."minecraft:custom_data".gm4_liquid_minecarts.liquid_tag
tag @e[type=item_display] remove gm4_lm_needs_texture

#setup tank data
data modify block ~ ~ ~ CustomName set from entity @s Passengers[0].item.components."minecraft:custom_data".gm4_liquid_minecarts.tank.CustomName
scoreboard players operation @s gm4_lm_data = @s gm4_lt_max
scoreboard players operation @s gm4_lm_data *= #5 gm4_lm_data
scoreboard players operation @s gm4_lm_data /= #2 gm4_lm_data
scoreboard players operation @e[type=marker,tag=gm4_liquid_tank,limit=1,sort=nearest,distance=..0.1] gm4_lt_max = @s gm4_lm_data

#apply liquid tag
data modify entity @e[type=marker,tag=gm4_liquid_tank,limit=1,sort=nearest,distance=..0.1] Tags append from entity @s Passengers[0].item.components."minecraft:custom_data".gm4_liquid_minecarts.liquid_tag
tag @e[type=marker,tag=gm4_liquid_tank,limit=1,sort=nearest,distance=..0.1] remove gm4_lt_empty

#load all cart liquid into tank
scoreboard players operation @e[type=marker,tag=gm4_liquid_tank,limit=1,sort=nearest,distance=..0.1] gm4_lt_value = @s gm4_lt_value
execute as @e[type=marker,limit=1,sort=nearest,tag=gm4_liquid_tank,distance=..0.1] run function gm4_liquid_tanks:liquid_value_update
scoreboard players set @s gm4_lt_value 0
tag @s add gm4_liquid_minecart_empty
execute as @e[type=armor_stand,limit=1,sort=nearest,tag=gm4_liquid_minecart_stand] run function gm4_liquid_minecarts:set_empty_data

playsound minecraft:block.brewing_stand.brew block @a ~ ~ ~ 1.0 1.5
function gm4_liquid_minecarts:liquid_value_update
