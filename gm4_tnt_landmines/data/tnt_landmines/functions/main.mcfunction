#creation
execute as @e[type=item,nbt={OnGround:1b,Item:{id:"minecraft:player_head",Count:1b,tag:{gm4_tnt_landmines:{item:1}}}},tag=!gm4_mine_safe,tag=!gm4_mine_checked] at @s run function tnt_landmines:checks/creation

#landmines
execute as @e[type=armor_stand,tag=gm4_tnt_mine] at @s run function tnt_landmines:checks/landmine

#fix landmine items
execute as @e[type=item,tag=!gm4_mine_checked,nbt={Item:{id:"minecraft:player_head",Count:1b}},nbt=!{Item:{tag:{gm4_tnt_landmines:{item:1}}}}] run function tnt_landmines:fix_skull
