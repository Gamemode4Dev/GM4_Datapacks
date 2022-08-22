# @s = tnt landmine item if block below it is air and doesn't have a nearby landmine
# positioned 1 block below the tnt landmine item
# run from checks/creation

# visuals
particle minecraft:ash ~ ~1.5 ~ 0 0.3 0 0.001 40 force
playsound minecraft:entity.tnt.primed block @a[distance=..8] ~ ~1 ~ 0.7 1.7

# check if it's an invisible one
execute if entity @s[nbt={Item:{tag:{gm4_tnt_landmines:{block:"minecraft:air"}}}}] run scoreboard players set invisible gm4_tnt_data 1

# create initial landmine armor stand
execute unless score invisible gm4_tnt_data matches 1 run summon armor_stand ~ ~ ~ {NoGravity:1b,Small:1b,Invisible:1b,Marker:1b,Invulnerable:1b,HasVisualFire:1,Tags:["gm4_tnt_mine_unset","gm4_no_edit","smithed.entity","smithed.strict"],DisabledSlots:4144959,ArmorItems:[{},{},{},{id:"minecraft:tnt",Count:1b}]}
execute if score invisible gm4_tnt_data matches 1 run summon armor_stand ~ ~ ~ {NoGravity:1b,Small:1b,Invisible:1b,Marker:1b,Invulnerable:1b,HasVisualFire:1,Tags:["gm4_tnt_mine_unset","gm4_no_edit","smithed.entity","smithed.strict"],DisabledSlots:4144959}
scoreboard players set @e[type=armor_stand,tag=gm4_tnt_mine_unset,limit=1,distance=..0.1] gm4_entity_version 1

# set helmet slot to block and set boots slot to tnt landmine item
data modify entity @e[type=armor_stand,tag=gm4_tnt_mine_unset,limit=1,distance=..0.1] ArmorItems[0] set from entity @s Item
execute unless score invisible gm4_tnt_data matches 1 run data modify entity @e[type=armor_stand,tag=gm4_tnt_mine_unset,limit=1,distance=..0.1] ArmorItems[3].id set from entity @s Item.tag.gm4_tnt_landmines.block
execute unless score invisible gm4_tnt_data matches 1 run data modify entity @e[type=armor_stand,tag=gm4_tnt_mine_unset,limit=1,distance=..0.1] ArmorItems[3].tag.CustomModelData set from entity @s Item.tag.CustomModelData

# set tags
execute if score invisible gm4_tnt_data matches 1 run tag @e[type=armor_stand,distance=..0.1,limit=1,tag=gm4_tnt_mine_unset] add gm4_mine_invisible
tag @e[type=armor_stand,tag=gm4_tnt_mine_unset,limit=1,distance=..0.1] add gm4_tnt_mine
tag @e[type=armor_stand,tag=gm4_tnt_mine_unset,limit=1,distance=..0.1] remove gm4_tnt_mine_unset

# disarm for 3 seconds
summon area_effect_cloud ~ ~ ~ {Duration:60,Tags:["gm4_mine_disarmed"]}
kill @s
scoreboard players reset invisible gm4_tnt_data
