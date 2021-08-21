schedule function gm4_guidebook:main 16t

# give random zombie villagers the guidebook
execute as @e[type=zombie_villager,tag=!gm4_guidebook_checked,predicate=gm4_guidebook:book_chance,nbt={HandItems:[{},{}],PersistenceRequired:0b}] unless data entity @s Gossips run function gm4_guidebook:update_book/zombie_villager
tag @e[type=zombie_villager] add gm4_guidebook_checked
