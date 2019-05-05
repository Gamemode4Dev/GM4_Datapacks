#checks entity for sacrifice
#@s - @e[type=minecraft:area_effect_cloud,tag=gm4_altar]
#called by rituals:altar/processes

#trident check
execute as @e[tag=!gm4_rit_no_sacrifice,distance=..1,nbt={HandItems:[{id:"minecraft:trident"}]}] run function rituals:altar/sacrifice/add_item/trident


#sheep
execute as @e[type=minecraft:sheep,tag=!gm4_rit_no_sacrifice,distance=..1] run function rituals:altar/sacrifice/sheep
#pig
execute as @e[type=minecraft:pig,tag=!gm4_rit_no_sacrifice,distance=..1] run function rituals:altar/sacrifice/pig
#zombie
execute as @e[type=minecraft:zombie,tag=!gm4_rit_no_sacrifice,distance=..1] run function rituals:altar/sacrifice/zombie
#drowned
execute as @e[type=minecraft:drowned,tag=!gm4_rit_no_sacrifice,distance=..1] run function rituals:altar/sacrifice/drowned
#wither skeleton
execute as @e[type=minecraft:wither_skeleton,tag=!gm4_rit_no_sacrifice,distance=..1] run function rituals:altar/sacrifice/wither_skeleton
