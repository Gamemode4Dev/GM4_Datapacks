# @s = machine block armor stand
# run from found_machine

loot spawn ~ ~ ~ mine ~ ~0.2 ~ minecraft:diamond_pickaxe{Enchantments:[{id:"minecraft:silk_touch",lvl:1}]}

data merge entity @e[type=item,limit=1,distance=..0.1,sort=nearest] {Tags:[gm4_rl_set_item_data],PickupDelay:30,Motion:[0.0,0.3,0.0],Item:{tag:{Enchantments:[{}],gm4_relocation:{loc:0.0d}}}}

data modify entity @e[tag=gm4_rl_set_item_data,limit=1,sort=nearest,distance=..0.1] Item.tag.display.Name set from block ~ ~.2 ~ CustomName

scoreboard players set sub_location gm4_rl_data 0
execute store result score location gm4_rl_data run data get block ~ ~.2 ~ y 100
execute store result score sub_location gm4_rl_data run data get entity @s Pos[1] 100
scoreboard players operation sub_location gm4_rl_data -= location gm4_rl_data
execute store result entity @e[tag=gm4_rl_set_item_data,limit=1,sort=nearest,distance=..0.1] Item.tag.gm4_relocation.loc double 0.01 run scoreboard players get sub_location gm4_rl_data

data modify entity @e[tag=gm4_rl_set_item_data,limit=1,sort=nearest,distance=..0.1] Item.tag.display.Lore prepend value '{"text":"Relocator","italic":true,"color":"yellow"}'

data modify entity @e[tag=gm4_rl_set_item_data,limit=1,sort=nearest,distance=..0.1] Item.tag.gm4_relocation.data.BlockName set from block ~ ~.2 ~ CustomName
data modify entity @e[tag=gm4_rl_set_item_data,limit=1,sort=nearest,distance=..0.1] Item.tag.gm4_relocation.data.Small set from entity @s Small
data modify entity @e[tag=gm4_rl_set_item_data,limit=1,sort=nearest,distance=..0.1] Item.tag.gm4_relocation.data.CustomName set from entity @s CustomName
data modify entity @e[tag=gm4_rl_set_item_data,limit=1,sort=nearest,distance=..0.1] Item.tag.gm4_relocation.data.ArmorItems set from entity @s ArmorItems
data modify entity @e[tag=gm4_rl_set_item_data,limit=1,sort=nearest,distance=..0.1] Item.tag.gm4_relocation.data.DisabledSlots set from entity @s DisabledSlots
data modify entity @e[tag=gm4_rl_set_item_data,limit=1,sort=nearest,distance=..0.1] Item.tag.gm4_relocation.data.Invulnerable set from entity @s Invulnerable
data modify entity @e[tag=gm4_rl_set_item_data,limit=1,sort=nearest,distance=..0.1] Item.tag.gm4_relocation.data.Pose set from entity @s Pose
data modify entity @e[tag=gm4_rl_set_item_data,limit=1,sort=nearest,distance=..0.1] Item.tag.gm4_relocation.data.Tags set from entity @s Tags
data modify entity @e[tag=gm4_rl_set_item_data,limit=1,sort=nearest,distance=..0.1] Item.tag.gm4_relocation.data.Lock set from block ~ ~0.2 ~ Lock
#data modify entity @e[tag=gm4_rl_set_item_data,limit=1,sort=nearest,distance=..0.1] Item.tag.gm4_relocation.data.Items set from block ~ ~0.2 ~ Items
data merge block ~ ~0.2 ~ {Items:[]}

execute if entity @e[tag=gm4_rl_set_item_data,distance=..0.1] run setblock ~ ~0.2 ~ air
execute if entity @e[tag=gm4_rl_set_item_data,distance=..0.1] run kill @s
execute as @e[tag=gm4_rl_set_item_data,distance=..0.1] at @s run tp ~ ~1 ~
execute positioned ~ ~1 ~ run tag @e[tag=gm4_rl_set_item_data,distance=..0.1] remove gm4_rl_set_item_data

playsound minecraft:block.beacon.power_select block @a[distance=..6] ~ ~ ~ 1 1.8
execute align xyz run particle minecraft:explosion ~.5 ~.5 ~.5 0 0 0 0 0
