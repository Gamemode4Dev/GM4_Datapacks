schedule function gm4_guidebook:main 16t

# give random zombie villagers the guidebook
execute as @e[type=zombie_villager,tag=!gm4_guidebook_checked,predicate=gm4_guidebook:chance_zombie_villager,nbt={PersistenceRequired:0b}] unless items entity @s weapon.* * unless data entity @s Gossips run function gm4_guidebook:get_book/zombie_villager with storage gm4_guidebook:register
tag @e[type=zombie_villager,tag=!gm4_guidebook_checked] add gm4_guidebook_checked

# process lectern markers
execute as @e[type=marker,tag=gm4_guide_lectern] at @s run function gm4_guidebook:lecterns/process
