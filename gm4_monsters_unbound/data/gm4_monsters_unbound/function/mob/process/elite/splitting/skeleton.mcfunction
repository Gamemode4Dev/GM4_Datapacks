# split splitting elite on death
# @s = item
# at @s
# run from mob/process/elite/on_death/run

data modify storage gm4_monsters_unbound:temp CustomName set from entity @s Item.components."minecraft:custom_name"

# only 2-3 of the spawned skeletons will have bows, the rest will be melee with wooden swords
scoreboard players set $has_bow gm4_mu_data 1
execute summon skeleton run function gm4_monsters_unbound:mob/process/elite/splitting/init_entity
execute summon skeleton run function gm4_monsters_unbound:mob/process/elite/splitting/init_entity
execute store result score $has_bow gm4_mu_data run random value 0..1
execute summon skeleton run function gm4_monsters_unbound:mob/process/elite/splitting/init_entity
scoreboard players set $has_bow gm4_mu_data 0
execute summon skeleton run function gm4_monsters_unbound:mob/process/elite/splitting/init_entity
execute summon skeleton run function gm4_monsters_unbound:mob/process/elite/splitting/init_entity
execute summon skeleton run function gm4_monsters_unbound:mob/process/elite/splitting/init_entity

data remove storage gm4_monsters_unbound:temp CustomName

