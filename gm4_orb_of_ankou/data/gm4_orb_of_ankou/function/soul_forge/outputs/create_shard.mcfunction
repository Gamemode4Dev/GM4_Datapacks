# @s = soul forge without fire, that has enough soul essences
# run from soul_forge/destroy

# spawn bat
summon minecraft:bat ~ ~ ~ {CustomName:'{"translate":"entity.gm4.possessed_shard","fallback":"Possessed Soul Shard§"}',CustomNameVisible:0b,Team:"gm4_hide_name",DeathLootTable:"minecraft:empty",PersistenceRequired:1b,Health:2.0f,Tags:["gm4_oa_unset","gm4_oa_possessed_soul_shard","gm4_oa_ignore","gm4_defused_bat"],active_effects:[{id:'minecraft:fire_resistance',amplifier:0b,duration:1000000,show_particles:0b}],ArmorDropChances:[0.0f,0.0f,0.0f,2.0f],ArmorItems:[{},{},{},{id:"minecraft:flint",count:1,components:{"minecraft:enchantment_glint_override":true,"minecraft:custom_name":'{"translate":"item.gm4.soul_shard","fallback":"Soul Shard","italic":false,"color":"white"}',"minecraft:attribute_modifiers":[{type:"generic.attack_damage",name:"generic.attack_damage",slot:"offhand",uuid:[I;0,612411,0,482012],amount:-0.2,operation:"add_multiplied_base"}],"minecraft:custom_data":{gm4_orb_of_ankou:{item:"soul_shard"}}}}]}

# set data of soul essence into soul shard
data modify storage gm4_orb_of_ankou:temp Drop set from entity @e[type=bat,tag=gm4_oa_unset,limit=1] ArmorItems[3]
data modify storage gm4_orb_of_ankou:temp Drop.components."minecraft:custom_model_data" set from storage gm4_orb_of_ankou:temp ArmorItems[1].components."minecraft:custom_model_data"
data modify storage gm4_orb_of_ankou:temp Drop.components."minecraft:lore"[] set from storage gm4_orb_of_ankou:temp ArmorItems[1].components."minecraft:lore"[0]
data modify storage gm4_orb_of_ankou:temp Drop.components."minecraft:custom_data".gm4_orb_of_ankou.pneumas[] set from storage gm4_orb_of_ankou:temp ArmorItems[1].components."minecraft:custom_data".gm4_orb_of_ankou.stored_pneuma
data modify storage gm4_orb_of_ankou:temp Drop.components."minecraft:attribute_modifiers" append from storage gm4_orb_of_ankou:temp ArmorItems[1].components."minecraft:custom_data".gm4_orb_of_ankou.stored_attributes[]
# TODO 1.20.5: verify that this combines the enchantments correctly
data modify storage gm4_orb_of_ankou:temp Drop.components."minecraft:enchantments" merge from storage gm4_orb_of_ankou:temp ArmorItems[1].components."minecraft:custom_data".gm4_orb_of_ankou.stored_enchantments
data modify storage gm4_orb_of_ankou:temp Drop.components."minecraft:custom_data".gm4_orb_of_ankou.stored_enchantments set from storage gm4_orb_of_ankou:temp ArmorItems[1].components."minecraft:custom_data".gm4_orb_of_ankou.stored_enchantments
data modify storage gm4_orb_of_ankou:temp Drop.components."minecraft:custom_data".gm4_orb_of_ankou.stored_attributes set from storage gm4_orb_of_ankou:temp ArmorItems[1].components."minecraft:custom_data".gm4_orb_of_ankou.stored_attributes
data modify storage gm4_orb_of_ankou:temp Drop.components."minecraft:custom_data".gm4_orb_of_ankou.stored_color set from storage gm4_orb_of_ankou:temp ArmorItems[1].components."minecraft:custom_data".gm4_orb_of_ankou.stored_color

data modify entity @e[type=bat,tag=gm4_oa_unset,limit=1] ArmorItems[3] set from storage gm4_orb_of_ankou:temp Drop
data remove storage gm4_orb_of_ankou:temp Drop
tag @e[type=bat] remove gm4_oa_unset

# loop if extra sets of 13
scoreboard players remove @s gm4_oa_essence 13
scoreboard players operation @s gm4_oa_powder -= required gm4_oa_powder
scoreboard players operation @s gm4_oa_glowstone -= required gm4_oa_glowstone
execute if score @s gm4_oa_essence matches 13.. if score @s gm4_oa_powder >= required gm4_oa_powder if score @s gm4_oa_glowstone >= required gm4_oa_glowstone run function gm4_orb_of_ankou:soul_forge/outputs/create_shard
