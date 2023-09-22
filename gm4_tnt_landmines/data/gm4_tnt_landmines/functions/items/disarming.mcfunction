# @s = valid pair of shears close enought to a tnt landmine
# at tnt landmine armor stand
# run from checks/landmine

#visuals
particle minecraft:explosion ~ ~1 ~
playsound minecraft:entity.sheep.shear block @a[distance=..8] ~ ~1 ~ 0.6 0.3
advancement grant @a[distance=..4,gamemode=!spectator] only gm4:tnt_landmines

#return item
summon item ~ ~1 ~ {Tags:["gm4_mine_checked","gm4_mine_new"],PickupDelay:30s,Motion:[0.0,0.4,0.0],Item:{id:":player_head",Count:1b,tag:{SkullOwner:"$landmine",gm4_tnt_landmines:{item:"landmine",block:"minecraft:tnt"},display:{Name:'{"italic":false,"translate":"item.gm4.tnt_landmine","fallback":"Landmine"}',Lore:['{"translate":"item.gm4.tnt_landmine.use","fallback":"Drop to use"}']}}}}
data modify entity @e[type=item,tag=gm4_mine_new,distance=..1.2,limit=1,sort=nearest] Item set from entity @e[type=armor_stand,tag=gm4_tnt_mine,distance=..0.1,limit=1,sort=nearest] ArmorItems[0]
tag @e[type=item,tag=gm4_mine_new,distance=..1.2,limit=1,sort=nearest] remove gm4_mine_new

#kill stand
kill @e[type=armor_stand,tag=gm4_tnt_mine,distance=..0.1]

#remove durability from shears
execute store result score @s gm4_tnt_data run data get entity @s Item.tag.Damage
scoreboard players add @s gm4_tnt_data 1
execute store result entity @s Item.tag.Damage int 1 run scoreboard players get @s gm4_tnt_data
execute if score @s gm4_tnt_data matches 238 run kill @s
