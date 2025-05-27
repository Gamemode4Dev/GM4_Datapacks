# @skyaccess

setblock ~ ~ ~ mangrove_stairs[facing=south]
summon item ~0.5 ~1 ~0.25 {Item:{id:"minecraft:saddle",count:1}}

await items entity @e[type=pig,dx=0] saddle minecraft:saddle
