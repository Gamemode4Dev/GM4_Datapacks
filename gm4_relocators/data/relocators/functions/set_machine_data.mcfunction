# @s = armor_stand tag=gm4_rl_set_stand_data
# run from placed_machine_block

data modify entity @e[type=armor_stand,tag=gm4_rl_set_stand_data,limit=1,distance=..0.01] Small set from entity @s SelectedItem.tag.gm4_relocation.data.Small
data modify entity @e[type=armor_stand,tag=gm4_rl_set_stand_data,limit=1,distance=..0.01] CustomName set from entity @s SelectedItem.tag.gm4_relocation.data.CustomName
data modify entity @e[type=armor_stand,tag=gm4_rl_set_stand_data,limit=1,distance=..0.01] ArmorItems set from entity @s SelectedItem.tag.gm4_relocation.data.ArmorItems
data modify entity @e[type=armor_stand,tag=gm4_rl_set_stand_data,limit=1,distance=..0.01] DisabledSlots set from entity @s SelectedItem.tag.gm4_relocation.data.DisabledSlots
data modify entity @e[type=armor_stand,tag=gm4_rl_set_stand_data,limit=1,distance=..0.01] Invulnerable set from entity @s SelectedItem.tag.gm4_relocation.data.Invulnerable
data modify entity @e[type=armor_stand,tag=gm4_rl_set_stand_data,limit=1,distance=..0.01] Pose set from entity @s SelectedItem.tag.gm4_relocation.data.Pose
data modify block ~ ~ ~ CustomName set from entity @s SelectedItem.tag.gm4_relocation.data.BlockName
#data modify block ~ ~ ~ Items set from entity @s SelectedItem.tag.gm4_relocation.data.Items
data modify block ~ ~ ~ Lock set from entity @s SelectedItem.tag.gm4_relocation.data.Lock

execute store result score location gm4_rl_data run data get entity @e[type=armor_stand,tag=gm4_rl_set_stand_data,limit=1,distance=..0.01] Pos[1] 100
execute store result score add_location gm4_rl_data run data get entity @s SelectedItem.tag.gm4_relocation.loc 100
scoreboard players operation location gm4_rl_data += add_location gm4_rl_data
execute store result entity @e[type=armor_stand,tag=gm4_rl_set_stand_data,limit=1,distance=..0.01] Pos[1] double 0.01 run scoreboard players get location gm4_rl_data
execute as @e[type=armor_stand,tag=gm4_rl_set_stand_data,distance=..1] at @s run tp ~ ~ ~

data modify entity @e[type=armor_stand,tag=gm4_rl_set_stand_data,limit=1,distance=..1.2,sort=nearest] Tags set from entity @s SelectedItem.tag.gm4_relocation.data.Tags

playsound minecraft:block.beacon.activate block @a[distance=..6] ~ ~ ~ 1 2
