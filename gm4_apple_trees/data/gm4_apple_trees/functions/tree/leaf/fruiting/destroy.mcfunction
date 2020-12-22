# removes an apple leaf armor stand if it is not inside a leaf anymore
# @s = any gm4_apple_leaf
# at @s align xyz positioned at the leaf block
# run from gm4_apple_trees:tree/leaf/fruiting/process

# spawn apple
execute if data entity @s[tag=gm4_ripe_apple] HandItems[0].id positioned ~0.5 ~1.5 ~0.5 run function gm4_apple_trees:tree/leaf/fruiting/spawn_apple
loot spawn ~0.5 ~ ~0.5 loot gm4_apple_trees:blocks/apple_tree_leaf

# kill
kill @s
