# @s = soul forge without fire, that has an orb and shard, unless the orb already has the pneuma
# run from soul_forge/outputs/check_fuse

# summon item
summon item ~ ~0.2 ~ {PickupDelay:40s,Glowing:1b,Item:{id:"minecraft:firework_star",Count:1b},Tags:["gm4_oa_unset"],Motion:[0.0,0.4,0.0]}

# restore data of stored orb
data modify storage gm4_orb_of_ankou:temp Item set from storage gm4_orb_of_ankou:temp ArmorItems[3]

# set data of soul shard into orb of ankou
data modify storage gm4_orb_of_ankou:temp Item.tag.display.Lore[0] set value '{"translate":"text.gm4.orb_of_ankou.pneumas","fallback":"Pneumas:","italic":false,"color":"light_purple"}'

data modify storage gm4_orb_of_ankou:temp Item.tag.display.Lore append from storage gm4_orb_of_ankou:temp ArmorItems[2].tag.display.Lore[]
data modify storage gm4_orb_of_ankou:temp Item.tag.gm4_orb_of_ankou.pneumas append from storage gm4_orb_of_ankou:temp ArmorItems[2].tag.gm4_orb_of_ankou.pneumas[]
data modify storage gm4_orb_of_ankou:temp Item.tag.Enchantments append from storage gm4_orb_of_ankou:temp ArmorItems[2].tag.gm4_orb_of_ankou.stored_enchantments[]
data modify storage gm4_orb_of_ankou:temp Item.tag.AttributeModifiers append from storage gm4_orb_of_ankou:temp ArmorItems[2].tag.gm4_orb_of_ankou.stored_attributes[]

#custom color
execute if score pneuma_count gm4_oa_forge matches 0 run data merge storage gm4_orb_of_ankou:temp {Item:{tag:{Explosion:{Colors:[I;]}}}}
data modify storage gm4_orb_of_ankou:temp Item.tag.Explosion.Colors append from storage gm4_orb_of_ankou:temp ArmorItems[2].tag.gm4_orb_of_ankou.stored_color[]

data modify entity @e[type=item,tag=gm4_oa_unset,limit=1] Item set from storage gm4_orb_of_ankou:temp Item
data remove storage gm4_orb_of_ankou:temp Item

# play sound and particle
playsound minecraft:entity.evoker.prepare_summon block @a[distance=..12] ~ ~ ~ 0.6 1.2
particle minecraft:explosion ~ ~0.8 ~ 0 0 0 0 0

# clear required ghast tears and wither roses
scoreboard players operation @s gm4_oa_tears -= required gm4_oa_tears
scoreboard players operation @s gm4_oa_roses -= required gm4_oa_roses
tag @s remove gm4_oa_has_orb
tag @s remove gm4_oa_has_shard
tag @e[type=item] remove gm4_oa_unset

# grant advancement
execute if score pneuma_count gm4_oa_forge matches 3.. run advancement grant @a[distance=..6] only gm4:max_orb_of_ankou
