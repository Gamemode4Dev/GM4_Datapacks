setblock ~ ~ ~ mangrove_stairs[facing=south]
summon item ~0.5 ~1 ~0.25 {Item:{id:"minecraft:saddle",Count:1b}}

await entity @e[type=pig,dx=0,nbt={Saddle:1b}]
