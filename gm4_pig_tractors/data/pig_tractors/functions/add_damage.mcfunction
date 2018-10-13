# @s = Person that harvested with pig tractor
# Called from crops folder
execute store result score @s gm4_hoe_damage run data get entity @s SelectedItem.tag.Damage
execute store result score @s gm4_hoe_percent run data get entity @s SelectedItem.tag.gm4_dam_percentage
scoreboard players add @s gm4_hoe_percent 4
scoreboard players remove @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:unbreaking",lvl:3s}]}}}] gm4_hoe_percent 3
scoreboard players remove @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:unbreaking",lvl:2s}]}}}] gm4_hoe_percent 2
scoreboard players remove @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:unbreaking",lvl:1s}]}}}] gm4_hoe_percent 1
execute if score @s gm4_hoe_percent matches 4.. run scoreboard players add @s gm4_hoe_damage 1
scoreboard players operation @s gm4_hoe_percent %= #4 gm4_hoe_damage
execute store result entity @s SelectedItem.tag.Damage short 1 run scoreboard players get @s gm4_hoe_damage
execute store result entity @s SelectedItem.tag.gm4_dam_percentage int 1 run scoreboard players get @s gm4_hoe_percent
execute if score @s gm4_hoe_damage matches ..-1 run playsound minecraft:item.shield.break master @s ~ ~ ~ 3
execute if score @s gm4_hoe_damage matches ..-1 run replaceitem entity @s weapon.mainhand air
