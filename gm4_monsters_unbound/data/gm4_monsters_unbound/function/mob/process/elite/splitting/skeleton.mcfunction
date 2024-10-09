# split splitting elite on death
# @s = item
# at @s
# run from mob/process/elite/on_death/run


data modify storage gm4_monsters_unbound:temp set.motion set value [0.23,0.33,0.22]
execute summon skeleton run function gm4_monsters_unbound:mob/process/elite/splitting/init_entity
data modify storage gm4_monsters_unbound:temp set.motion set value [-0.12,0.21,0.21]
execute summon skeleton run function gm4_monsters_unbound:mob/process/elite/splitting/init_entity
data modify storage gm4_monsters_unbound:temp set.motion set value [0.17,0.46,-0.12]
execute summon skeleton run function gm4_monsters_unbound:mob/process/elite/splitting/init_entity
data modify storage gm4_monsters_unbound:temp set.motion set value [-0.17,0.19,-0.09]
execute summon skeleton run function gm4_monsters_unbound:mob/process/elite/splitting/init_entity
data modify storage gm4_monsters_unbound:temp set.motion set value [-0.21,0.61,0.12]
execute summon skeleton run function gm4_monsters_unbound:mob/process/elite/splitting/init_entity
data modify storage gm4_monsters_unbound:temp set.motion set value [0.02,0.58,0.28]
execute summon skeleton run function gm4_monsters_unbound:mob/process/elite/splitting/init_entity
