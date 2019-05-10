#run from load_liquid, unload_liquid and create
#@s = liquid minecart

#calculate tank fullness percentage
scoreboard players operation @s gm4_lm_data = @s gm4_lt_value
scoreboard players operation @s gm4_lm_data *= 100 gm4_lm_data
scoreboard players operation @s gm4_lm_data /= @s gm4_lt_max

scoreboard players operation @s gm4_lt_disp_val = @s gm4_lm_data

#1%-50%
execute if score @s gm4_lt_value matches 1.. if score @s gm4_lm_data matches 0..50 run data merge entity @e[type=armor_stand,tag=gm4_liquid_minecart_display,limit=1,sort=nearest] {ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"42ceac16-1b02-4889-8d85-f8b7a167b0b3",Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvNTEzNjg2ZjIxMDY1YTRiZTZjYzU3MDYxZDhlNzM2MDQ3MzQ2YzU4NmEzYTU1OWMwMzdhMDMxNGJjNDUyOTA4MSJ9fX0="}]}}}}]}
#51%-99%
execute unless score @s gm4_lt_value = @s gm4_lt_max if score @s gm4_lm_data matches 51..100 run data merge entity @e[type=armor_stand,tag=gm4_liquid_minecart_display,limit=1,sort=nearest] {ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"ec98f0b8-97a1-47a0-9786-7071ed229a0e",Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvMmFjOTBjM2ZmNWI5NzBhNTIyNTliNTdhNDlmMjFmOGE1NTdmZmIxYTM2ZmNjNDkwMDQyMTQzNDZkOWViN2RmZCJ9fX0="}]}}}}]}
#100%
execute if score @s gm4_lt_value = @s gm4_lt_max run data merge entity @e[type=armor_stand,tag=gm4_liquid_minecart_display,limit=1,sort=nearest] {ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"ff983ce0-57a7-4ec6-9cdf-6090de1adc6d",Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvM2M5OTI4ODgxNGY1ODVjN2JjMmU1NWQ0NDY0ZDUzOGQwZDlkOWM4YjE4NzRiZTA5ZDc4Yjk3YzA3YzAwYWIxYSJ9fX0="}]}}}}]}
#0%
execute if score @s gm4_lt_value matches 0 run data merge entity @e[type=armor_stand,tag=gm4_liquid_minecart_display,limit=1,sort=nearest] {ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"0720bc21-0c53-4856-bd45-d8d5e0f96f78",Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvZjhiMjU1MjJjMzFiZmU0Y2VhMTAxMDA4MGQ1YTFiOWIwOGU3NWJhZTUzOGRhODk3MmNiZGQ2YTk0Mzk5MjEyYSJ9fX0="}]}}}}]}

scoreboard players set @s gm4_lm_data 0
