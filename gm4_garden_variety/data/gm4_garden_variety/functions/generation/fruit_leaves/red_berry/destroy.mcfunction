# removes an TREE_TYPE fruit leaf armor stand if it is not inside a leaf anymore
# @s = any TREE_TYPE fruit leaf
# at @s align xyz positioned at the leaf block
# run from gm4_natural_trees:trees/TREE_TYPE/fruiting/leaf/fruit/process

# spawn apple
execute if data entity @s[tag=gm4_ripe_red_berry_fruit] HandItems[0].id positioned ~0.5 ~1.5 ~0.5 run function gm4_garden_variety:generation/fruit_leaves/red_berry/spawn_fruit

# kill
kill @s
