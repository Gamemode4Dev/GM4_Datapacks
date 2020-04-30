#@s = tank with entity above it positioned ~ ~-1 ~
#run from liquid_tanks:process via #gm4_liquid_tanks:util_below

tag @s add gm4_processing_tank

#milk clearing potion effects
execute if score @s[tag=gm4_lt_milk] gm4_lt_value matches 3.. as @e[team=!invalid_team,type=!armor_stand,limit=1,dx=0] unless entity @s[gamemode=spectator] if entity @s[nbt={ActiveEffects:[{}]}] run function gm4_standard_liquids:util/liquid_dispensing/milk

#honey clearing poison and applying saturation
execute if score @s[tag=gm4_lt_honey] gm4_lt_value matches 1.. as @e[team=!invalid_team,type=!armor_stand,limit=1,dx=0] unless entity @s[gamemode=spectator] if entity @s[nbt={ActiveEffects:[{Id:19b}]}] run function gm4_standard_liquids:util/liquid_dispensing/honey
execute if score @s[tag=gm4_lt_honey] gm4_lt_value matches 1.. as @a[gamemode=!spectator,limit=1,dx=0] unless entity @s[nbt={foodLevel:20}] run function gm4_standard_liquids:util/liquid_dispensing/honey

#mushroom soup applying saturation
execute if score @s[tag=gm4_lt_mushroom_stew] gm4_lt_value matches 1.. as @a[gamemode=!spectator,limit=1,dx=0] unless entity @s[nbt={foodLevel:20}] run function gm4_standard_liquids:util/liquid_dispensing/mushroom_stew

#rabbit stew applying saturation
execute if score @s[tag=gm4_lt_rabbit_stew] gm4_lt_value matches 1.. as @a[gamemode=!spectator,limit=1,dx=0] unless entity @s[nbt={foodLevel:20}] run function gm4_standard_liquids:util/liquid_dispensing/rabbit_stew

#beetroot soup applying saturation
execute if score @s[tag=gm4_lt_beetroot_soup] gm4_lt_value matches 1.. as @a[gamemode=!spectator,limit=1,dx=0] unless entity @s[nbt={foodLevel:20}] run function gm4_standard_liquids:util/liquid_dispensing/beetroot_soup

#player withdrawing experience
execute if score standard_liquids_withdraw_experience gm4_lt_util matches 2 run scoreboard players set standard_liquids_withdraw_experience gm4_lt_util 0
execute positioned ~0.5 ~-1 ~0.5 if entity @a[distance=..0.5,gamemode=!spectator] run scoreboard players set standard_liquids_withdraw_experience gm4_lt_util 1

tag @s remove gm4_processing_tank
