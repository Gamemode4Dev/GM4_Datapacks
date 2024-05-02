# @s = valid pair of shears close enought to a tnt landmine
# at tnt landmine armor stand
# run from checks/landmine

#visuals
particle minecraft:explosion ~ ~1 ~
playsound minecraft:entity.sheep.shear block @a[distance=..8] ~ ~1 ~ 0.6 0.3
advancement grant @a[distance=..4,gamemode=!spectator] only gm4:tnt_landmines

#return item
summon item ~ ~1 ~ {Tags:["gm4_mine_checked","gm4_mine_new"],PickupDelay:30s,Motion:[0.0,0.4,0.0],Item:{id:"minecraft:player_head",count:1,components:{"minecraft:profile":"$landmine","minecraft:custom_data":{gm4_tnt_landmines:{item:"landmine",block:"minecraft:tnt"}},"minecraft:custom_name":'{"italic":false,"translate":"item.gm4.tnt_landmine","fallback":"Landmine"}',"minecraft:lore":['{"translate":"item.gm4.tnt_landmine.use","fallback":"Drop to use"}']}}}
data modify entity @e[type=item,tag=gm4_mine_new,distance=..1.2,limit=1,sort=nearest] Item set from entity @e[type=armor_stand,tag=gm4_tnt_mine,distance=..0.1,limit=1,sort=nearest] ArmorItems[0]
tag @e[type=item,tag=gm4_mine_new,distance=..1.2,limit=1,sort=nearest] remove gm4_mine_new

#kill stand
kill @e[type=armor_stand,tag=gm4_tnt_mine,distance=..0.1]

#remove durability from shears
execute store result score @s gm4_tnt_data run data get entity @s Item.components."minecraft:damage"
scoreboard players add @s gm4_tnt_data 1
execute store result entity @s Item.components."minecraft:damage" int 1 run scoreboard players get @s gm4_tnt_data
execute if score @s gm4_tnt_data matches 238 run kill @s
