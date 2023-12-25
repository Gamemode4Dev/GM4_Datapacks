setblock ~ ~ ~ mangrove_stairs[facing=south]
summon item ~0.5 ~1 ~0.25 {Item:{id:"minecraft:saddle",Count:1b}}

succeed when entity @e[type=pig,dx=0,nbt={Saddle:1b}]
