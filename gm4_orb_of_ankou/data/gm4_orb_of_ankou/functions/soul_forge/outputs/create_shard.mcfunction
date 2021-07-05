# @s = soul forge without fire, that has enough soul essences
# run from soul_forge/destroy

# spawn bat
summon minecraft:bat ~ ~ ~ {CustomName:'{"translate":"%1$s%3427655$s","with":["Possessed Soul Shard",{"translate":"entity.gm4.possessed_shard"}]}',CustomNameVisible:0b,DeathLootTable:"minecraft:empty",PersistenceRequired:1b,Health:2.0f,Tags:["gm4_oa_unset","gm4_oa_possessed_soul_shard","gm4_oa_ignore","gm4_defused_bat"],ActiveEffects:[{Id:12b,Amplifier:0b,Duration:1000000,ShowParticles:0b}],ArmorDropChances:[0.0f,0.0f,0.0f,2.0f],ArmorItems:[{},{},{},{id:"minecraft:flint",Count:1b,tag:{AttributeModifiers:[{AttributeName:"generic.attack_damage",Name:"generic.attack_damage",Amount:-0.2,Operation:1,UUID:[I;0,612411,0,482012],Slot:"offhand"}],gm4_orb_of_ankou:{item:"soul_shard"},Enchantments:[{id:"minecraft:protection",lvl:0s}],HideFlags:1,display:{Name:'{"translate":"%1$s%3427655$s","with":["Soul Shard",{"translate":"item.gm4.soul_shard"}],"italic":false,"color":"white"}'}}}]}

# set data of soul essence into soul shard
data modify entity @e[type=bat,tag=gm4_oa_unset,limit=1,sort=nearest] ArmorItems[3].tag.CustomModelData set from entity @s ArmorItems[1].tag.CustomModelData
data modify entity @e[type=bat,tag=gm4_oa_unset,limit=1,sort=nearest] ArmorItems[3].tag.display.Lore[] set from entity @s ArmorItems[1].tag.display.Lore[0]
data modify entity @e[type=bat,tag=gm4_oa_unset,limit=1,sort=nearest] ArmorItems[3].tag.gm4_orb_of_ankou.pneumas[] set from entity @s ArmorItems[1].tag.gm4_orb_of_ankou.stored_pneuma
data modify entity @e[type=bat,tag=gm4_oa_unset,limit=1,sort=nearest] ArmorItems[3].tag.AttributeModifiers append from entity @s ArmorItems[1].tag.gm4_orb_of_ankou.stored_attributes[]
data modify entity @e[type=bat,tag=gm4_oa_unset,limit=1,sort=nearest] ArmorItems[3].tag.Enchantments append from entity @s ArmorItems[1].tag.gm4_orb_of_ankou.stored_enchantments[]
data modify entity @e[type=bat,tag=gm4_oa_unset,limit=1,sort=nearest] ArmorItems[3].tag.gm4_orb_of_ankou.stored_enchantments set from entity @s ArmorItems[1].tag.gm4_orb_of_ankou.stored_enchantments
data modify entity @e[type=bat,tag=gm4_oa_unset,limit=1,sort=nearest] ArmorItems[3].tag.gm4_orb_of_ankou.stored_attributes set from entity @s ArmorItems[1].tag.gm4_orb_of_ankou.stored_attributes
data modify entity @e[type=bat,tag=gm4_oa_unset,limit=1,sort=nearest] ArmorItems[3].tag.gm4_orb_of_ankou.stored_color set from entity @s ArmorItems[1].tag.gm4_orb_of_ankou.stored_color

tag @e[type=bat,tag=gm4_oa_unset,limit=1,sort=nearest] remove gm4_oa_unset

# loop if extra sets of 13
scoreboard players remove @s gm4_oa_essence 13
scoreboard players operation @s gm4_oa_powder -= required gm4_oa_powder
scoreboard players operation @s gm4_oa_glowstone -= required gm4_oa_glowstone
execute if score @s gm4_oa_essence matches 13.. if score @s gm4_oa_powder >= required gm4_oa_powder if score @s gm4_oa_glowstone >= required gm4_oa_glowstone run function gm4_orb_of_ankou:soul_forge/outputs/create_shard
