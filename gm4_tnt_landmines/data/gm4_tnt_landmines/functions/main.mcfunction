#creation
execute as @e[type=item,tag=!gm4_mine_checked] if items entity @s contents minecraft:player_head[count=1,custom_data~{gm4_tnt_landmines:{item:"landmine"}}] if entity @s[nbt={OnGround:1b}] at @s run function gm4_tnt_landmines:checks/creation

#landmines
execute as @e[type=armor_stand,tag=gm4_tnt_mine,tag=!smithed.entity] run function gm4_tnt_landmines:upgrade_path/smithed_compat
execute as @e[type=armor_stand,tag=gm4_tnt_mine] at @s run function gm4_tnt_landmines:checks/landmine

#sedual the datapack to be loaded again in 16t
schedule function gm4_tnt_landmines:main 16t
