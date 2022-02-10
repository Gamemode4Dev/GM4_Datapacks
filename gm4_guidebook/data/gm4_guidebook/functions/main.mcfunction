schedule function gm4_guidebook:main 16t

# give random zombie villagers the guidebook
execute as @e[type=zombie_villager,tag=!gm4_guidebook_checked,predicate=gm4_guidebook:chance_zombie_villager,nbt={HandItems:[{},{}],PersistenceRequired:0b}] unless data entity @s Gossips run function gm4_guidebook:update_book/zombie_villager
tag @e[type=zombie_villager] add gm4_guidebook_checked
