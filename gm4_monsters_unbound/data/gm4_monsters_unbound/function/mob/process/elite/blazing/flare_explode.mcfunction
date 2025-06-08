# explode the flare
# @s = flare block_display
# at @s
# run from mob/process/elite/blazing/process_flare

particle flame ~ ~ ~ 0.01 0.01 0.01 0.1 32
particle explosion ~ ~ ~ 0 0 0 40 0

playsound entity.generic.explode hostile @a ~ ~ ~ 1 1.4
playsound item.firecharge.use hostile @a ~ ~ ~ 1 0.7

# hit players
tag @s add gm4_mu_self
execute positioned ~-.22 ~-.22 ~-.22 as @a[dx=0,dy=0,dz=0] positioned ~-0.34 ~-0.34 ~-0.34 as @s[dx=0,dy=0,dz=0] run function gm4_monsters_unbound:mob/process/elite/blazing/flare_damage
tag @s remove gm4_mu_self

kill @s
