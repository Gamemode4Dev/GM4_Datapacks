setblock ~ ~ ~ emerald_block replace
data merge entity @s {CustomName:'"gm4_potion_infuser"',ArmorItems:[{},{},{},{id:iron_block,Count:1b}]}
playsound minecraft:block.brewing_stand.brew block @a[distance=..5] ~ ~ ~ 1 1.7
tp @s ~ ~.1 ~
tag @s add gm4_potion_infuser
tag @s remove gm4_custom_crafter
advancement grant @a[distance=..3,gamemode=!spectator] only gm4:potion_infusers_create
