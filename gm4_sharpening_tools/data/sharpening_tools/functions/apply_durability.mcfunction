#@s = crafters containing a sharpened tool
#Run from recipe_check


playsound minecraft:entity.sheep.shear block @a[distance=..4] ~ ~ ~ .7 1

execute store result score sharpen_value gm4_st_damage run data get block ~ ~ ~ Items[1].tag.gm4_sharpening_tools.gm4_sharpen_value
scoreboard players operation @s gm4_st_damage -= sharpen_value gm4_st_damage
execute if score @s gm4_st_damage matches ..-1 run scoreboard players set @s gm4_st_damage 0
execute store result block ~ ~ ~ Items[0].tag.Damage int 1 run scoreboard players get @s gm4_st_damage
#data remove block

execute store success score save_ench gm4_st_damage run data get block ~ ~ ~ Items[1].tag.gm4_sharpening_tools.gm4_save_ench
data remove block ~ ~ ~ Items[1]
execute unless score save_ench gm4_st_damage matches 1 run data remove block ~ ~ ~ Items[0].tag.Enchantments