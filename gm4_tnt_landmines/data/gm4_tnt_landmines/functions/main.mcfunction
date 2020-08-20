#creation
execute as @e[type=item,tag=!gm4_mine_checked,nbt={OnGround:1b,Item:{id:"minecraft:player_head",Count:1b,tag:{gm4_tnt_landmines:{item:"landmine"}}}}] at @s run function gm4_tnt_landmines:checks/creation

#landmines
execute as @e[type=armor_stand,tag=gm4_tnt_mine] at @s run function gm4_tnt_landmines:checks/landmine

#fix landmine items
execute as @e[type=item,tag=!gm4_mine_checked,nbt={Item:{id:"minecraft:player_head",Count:1b}},nbt=!{Item:{tag:{gm4_tnt_landmines:{item:"landmine"}}}}] run function gm4_tnt_landmines:fix_skull

#sedual the datapack to be loaded again in 16t
schedule function gm4_tnt_landmines:main 16t
