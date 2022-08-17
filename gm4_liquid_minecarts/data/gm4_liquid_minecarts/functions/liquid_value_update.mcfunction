#@s = liquid minecart
#run from load_liquid, unload_liquid and create

#calculate tank fullness percentage
scoreboard players operation @s gm4_lm_data = @s gm4_lt_value
scoreboard players operation @s gm4_lm_data *= #100 gm4_lm_data
scoreboard players operation @s gm4_lm_data /= @s gm4_lt_max

#1%-50%
execute if score @s gm4_lt_value matches 1.. if score @s gm4_lm_data matches 0..50 run data modify entity @e[type=armor_stand,tag=gm4_liquid_minecart_stand,limit=1,sort=nearest] ArmorItems[3] merge value {id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:[I;1120840726,453134473,-1920599881,-1587040077],Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvNTEzNjg2ZjIxMDY1YTRiZTZjYzU3MDYxZDhlNzM2MDQ3MzQ2YzU4NmEzYTU1OWMwMzdhMDMxNGJjNDUyOTA4MSJ9fX0="}]}}}}
#51%-99%
execute unless score @s gm4_lt_value = @s gm4_lt_max if score @s gm4_lm_data matches 51..100 run data modify entity @e[type=armor_stand,tag=gm4_liquid_minecart_stand,limit=1,sort=nearest] ArmorItems[3] merge value {id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:[I;-325521224,-1751038048,-1752797071,-316499442],Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvMmFjOTBjM2ZmNWI5NzBhNTIyNTliNTdhNDlmMjFmOGE1NTdmZmIxYTM2ZmNjNDkwMDQyMTQzNDZkOWViN2RmZCJ9fX0="}]}}}}
#100%
execute if score @s gm4_lt_value = @s gm4_lt_max run data modify entity @e[type=armor_stand,tag=gm4_liquid_minecart_stand,limit=1,sort=nearest] ArmorItems[3] merge value {id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:[I;-6800160,1470582470,-1663082352,-568664979],Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvM2M5OTI4ODgxNGY1ODVjN2JjMmU1NWQ0NDY0ZDUzOGQwZDlkOWM4YjE4NzRiZTA5ZDc4Yjk3YzA3YzAwYWIxYSJ9fX0="}]}}}}
#0%
execute if score @s gm4_lt_value matches 0 run data modify entity @e[type=armor_stand,tag=gm4_liquid_minecart_stand,limit=1,sort=nearest] ArmorItems[3] merge value {id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:[I;119585825,206784598,-1119495979,-520523912],Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvZjhiMjU1MjJjMzFiZmU0Y2VhMTAxMDA4MGQ1YTFiOWIwOGU3NWJhZTUzOGRhODk3MmNiZGQ2YTk0Mzk5MjEyYSJ9fX0="}]}}}}
