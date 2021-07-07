# @s = boiling zauber cauldron with recipe inside
# at center of block
# run from recipes/potions/ recipes
# applies environmental effects caused by recipes

fill ~-1 ~ ~-1 ~1 ~1 ~1 fire replace #gm4:air
playsound item.firecharge.use block @a[distance=..8] ~ ~ ~ 0.8 0.6
