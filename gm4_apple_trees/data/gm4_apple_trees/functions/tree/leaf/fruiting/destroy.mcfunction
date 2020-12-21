# removes an apple leaf armor stand if it is not inside a leaf anymore
# @s = any gm4_apple_leaf
# at @s align xyz
# run from gm4_apple_trees:tree/leaf/fruiting/process

# spawn apple
execute if data entity @s HandItems[0].id positioned ~0.5 ~1.5 ~0.5 run function gm4_apple_trees:tree/leaf/fruiting/spawn_apple

# kill
kill @s
