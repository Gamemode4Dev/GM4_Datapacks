#@s = liquid minecart
#run from try_to_unload

data modify block ~ ~ ~ CustomName set from entity @s CustomName
summon armor_stand ~ ~-.45 ~ {CustomName:"\"gm4_liquid_tank_display\"",Tags:["gm4_no_edit","gm4_liquid_tank_display","gm4_lm_needs_texture"],NoGravity:1,Marker:1,Invisible:1,Invulnerable:1,Small:1,DisabledSlots:2039583,Fire:20000}
data modify entity @e[type=armor_stand,tag=gm4_lm_needs_texture,limit=1,sort=nearest] ArmorItems[3] set from entity @e[type=armor_stand,tag=gm4_liquid_minecart_display,limit=1,sort=nearest] HandItems[0]
tag @e[type=armor_stand] remove gm4_lm_needs_texture
scoreboard players operation @s gm4_lm_data = @s gm4_lt_max
scoreboard players operation @s gm4_lm_data *= #5 gm4_lm_data
scoreboard players operation @s gm4_lm_data /= #2 gm4_lm_data
scoreboard players operation @e[type=armor_stand,tag=gm4_liquid_tank,limit=1,sort=nearest,distance=..0.5] gm4_lt_max = @s gm4_lm_data
scoreboard players operation @e[type=armor_stand,tag=gm4_liquid_tank,limit=1,sort=nearest,distance=..0.5] gm4_lt_value = @s gm4_lt_value
scoreboard players set @s gm4_lt_value 0

#apply liquid tag
tag @s remove gm4_liquid_minecart
tag @s add gm4_lm_to_lt
data modify entity @e[type=armor_stand,tag=gm4_liquid_tank,limit=1,sort=nearest,distance=..0.5] Tags set from entity @s Tags
data merge entity @s {Tags:["gm4_liquid_minecart","gm4_liquid_minecart_empty"]}
playsound minecraft:block.brewing_stand.brew block @a ~ ~ ~ 1.0 1.5
execute as @e[type=armor_stand,tag=gm4_lm_to_lt,limit=1,sort=nearest,distance=..0.5] run function gm4_liquid_minecarts:minecart_to_tank_init
function gm4_liquid_minecarts:liquid_value_update
