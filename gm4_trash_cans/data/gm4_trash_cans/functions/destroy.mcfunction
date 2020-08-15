# @s = trash_can that has been broken
# run from update

loot spawn ~ ~.6 ~ loot gm4_trash_cans:destroy_trash_can
particle block piston ~ ~1 ~ .1 .25 .1 .05 30 normal @a
kill @s
