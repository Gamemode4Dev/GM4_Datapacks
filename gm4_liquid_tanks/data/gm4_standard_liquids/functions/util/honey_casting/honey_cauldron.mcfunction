#@s = liquid tank, positioned at empty cauldron
#run from standard_liquids:util_above

execute if score @s gm4_lt_util matches 4.. run scoreboard players remove @s gm4_lt_value 4
execute if score @s gm4_lt_util matches 4.. run summon armor_stand ~0.5 ~ ~0.5 {Marker:1,Invisible:1,Invulnerable:1,NoGravity:1,Silent:1,Fire:4000s,Tags:["gm4_lt_honey_display","gm4_no_edit"],CustomName:'"gm4_lt_honey_display"',Pose:{Head:[180.0f,0.0f,0.0f]},ArmorItems:[{},{},{},{id:"minecraft:honey_block",Count:1,tag:{CustomModelData:3420001}}],DisabledSlots:4144959}
execute if score @s gm4_lt_util matches 4.. run playsound block.honey_block.slide block @a[distance=..10] ~ ~ ~ 1 0.5
execute if score @s gm4_lt_util matches 4.. run scoreboard players remove @s gm4_lt_util 4

execute unless score @s gm4_lt_prior_val = @s gm4_lt_value run function gm4_liquid_tanks:liquid_value_update

schedule function gm4_standard_liquids:util/honey_casting/scheduled_honey_rise 4t
