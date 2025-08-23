# split splitting elite on death
# @s = item
# at @s
# run from mob/process/elite/on_death/run

data modify storage gm4_monsters_unbound:temp CustomName set from entity @s Item.components."minecraft:custom_name"

execute summon zombie run function gm4_monsters_unbound:mob/process/elite/splitting/init_entity
execute summon zombie run function gm4_monsters_unbound:mob/process/elite/splitting/init_entity
execute summon zombie run function gm4_monsters_unbound:mob/process/elite/splitting/init_entity
execute summon zombie run function gm4_monsters_unbound:mob/process/elite/splitting/init_entity
execute summon zombie run function gm4_monsters_unbound:mob/process/elite/splitting/init_entity
execute summon zombie run function gm4_monsters_unbound:mob/process/elite/splitting/init_entity

data remove storage gm4_monsters_unbound:temp CustomName
