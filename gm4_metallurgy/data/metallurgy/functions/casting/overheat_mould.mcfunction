#@s = moulds that need to explode in fire and Death
# run from destroy_mould

setblock ~ ~ ~ lava[level=1]
summon item ~ ~1.2 ~ {Item:{id:"minecraft:magma_block",Count:1b,tag:{display:{Lore:["slightly overheated obsidian"]}}},Motion:[0.0f,0.9f,0.0f]}
particle large_smoke ~ ~ ~ 0.2 0.2 0.2 0.05 20
playsound block.fire.extinguish block @a ~ ~ ~ .25 .9
fill ~1 ~1 ~1 ~-1 ~-1 ~-1 fire replace air
