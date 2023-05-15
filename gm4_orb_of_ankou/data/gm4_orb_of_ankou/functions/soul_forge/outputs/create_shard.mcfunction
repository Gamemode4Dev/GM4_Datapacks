# @s = soul forge without fire, that has enough soul essences
# run from soul_forge/destroy

# spawn bat
summon minecraft:bat ~ ~ ~ {CustomName:'{"translate":"entity.gm4.possessed_shard","fallback":"Possessed Soul Shard§"}',CustomNameVisible:0b,Team:"gm4_hide_name",DeathLootTable:"minecraft:empty",PersistenceRequired:1b,Health:2.0f,Tags:["gm4_oa_unset","gm4_oa_possessed_soul_shard","gm4_oa_ignore","gm4_defused_bat"],ActiveEffects:[{Id:12,Amplifier:0b,Duration:1000000,ShowParticles:0b}],ArmorDropChances:[0.0f,0.0f,0.0f,2.0f],ArmorItems:[{},{},{},{id:"minecraft:flint",Count:1b,tag:{AttributeModifiers:[{AttributeName:"generic.attack_damage",Name:"generic.attack_damage",Amount:-0.2,Operation:1,UUID:[I;0,612411,0,482012],Slot:"offhand"}],gm4_orb_of_ankou:{item:"soul_shard"},Enchantments:[{id:"minecraft:protection",lvl:0s}],HideFlags:1,display:{Name:'{"translate":"item.gm4.soul_shard","fallback":"Soul Shard","italic":false,"color":"white"}'}}}]}

# set data of soul essence into soul shard
data modify storage gm4_orb_of_ankou:temp Drop set from entity @e[type=bat,tag=gm4_oa_unset,limit=1] ArmorItems[3]
data modify storage gm4_orb_of_ankou:temp Drop.tag.CustomModelData set from storage gm4_orb_of_ankou:temp ArmorItems[1].tag.CustomModelData
data modify storage gm4_orb_of_ankou:temp Drop.tag.display.Lore[] set from storage gm4_orb_of_ankou:temp ArmorItems[1].tag.display.Lore[0]
data modify storage gm4_orb_of_ankou:temp Drop.tag.gm4_orb_of_ankou.pneumas[] set from storage gm4_orb_of_ankou:temp ArmorItems[1].tag.gm4_orb_of_ankou.stored_pneuma
data modify storage gm4_orb_of_ankou:temp Drop.tag.AttributeModifiers append from storage gm4_orb_of_ankou:temp ArmorItems[1].tag.gm4_orb_of_ankou.stored_attributes[]
data modify storage gm4_orb_of_ankou:temp Drop.tag.Enchantments append from storage gm4_orb_of_ankou:temp ArmorItems[1].tag.gm4_orb_of_ankou.stored_enchantments[]
data modify storage gm4_orb_of_ankou:temp Drop.tag.gm4_orb_of_ankou.stored_enchantments set from storage gm4_orb_of_ankou:temp ArmorItems[1].tag.gm4_orb_of_ankou.stored_enchantments
data modify storage gm4_orb_of_ankou:temp Drop.tag.gm4_orb_of_ankou.stored_attributes set from storage gm4_orb_of_ankou:temp ArmorItems[1].tag.gm4_orb_of_ankou.stored_attributes
data modify storage gm4_orb_of_ankou:temp Drop.tag.gm4_orb_of_ankou.stored_color set from storage gm4_orb_of_ankou:temp ArmorItems[1].tag.gm4_orb_of_ankou.stored_color

data modify entity @e[type=bat,tag=gm4_oa_unset,limit=1] ArmorItems[3] set from storage gm4_orb_of_ankou:temp Drop
data remove storage gm4_orb_of_ankou:temp Drop
tag @e[type=bat] remove gm4_oa_unset

# loop if extra sets of 13
scoreboard players remove @s gm4_oa_essence 13
scoreboard players operation @s gm4_oa_powder -= required gm4_oa_powder
scoreboard players operation @s gm4_oa_glowstone -= required gm4_oa_glowstone
execute if score @s gm4_oa_essence matches 13.. if score @s gm4_oa_powder >= required gm4_oa_powder if score @s gm4_oa_glowstone >= required gm4_oa_glowstone run function gm4_orb_of_ankou:soul_forge/outputs/create_shard
