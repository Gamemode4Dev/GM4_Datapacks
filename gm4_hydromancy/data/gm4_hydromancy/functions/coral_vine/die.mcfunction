
setblock ~ ~ ~ mangrove_roots
particle block mangrove_roots ~ ~ ~ 0.35 0.35 0.35 0.1 8
playsound block.mangrove_roots.break block @a ~ ~ ~ 0.6 0.8
tag @s remove gm4_hy_coral_vine.alive

# TODO: kill bud
execute if entity @s[tag=gm4_hy_coral_vine.budded]
