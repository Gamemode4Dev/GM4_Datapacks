#@s = custom crafters with blast furnace recipe inside
data merge block ~ ~ ~ {Items:[]}
summon area_effect_cloud ~ ~ ~ {Duration:2147483647,Tags:["gm4_blast_furnace"]}
setblock ~ ~ ~ hopper{CustomName:'{"translate":"%1$s%3427655$s","with":["Blast Furnace",{"translate":"block.gm4.blast_furnaces"}]}'}
playsound block.anvil.use block @a[distance=..4] ~ ~ ~ 1 0.8 1
advancement grant @a[distance=..4] only gm4:blast_furnaces
kill @s
