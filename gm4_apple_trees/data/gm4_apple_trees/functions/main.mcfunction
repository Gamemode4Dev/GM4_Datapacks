# apple leaf keepalive
execute as @e[type=armor_stand,tag=gm4_apple_leaf] at @s align xyz run function gm4_apple_trees:tree/leaf/fruiting/process


schedule function gm4_apple_trees:main 16t
