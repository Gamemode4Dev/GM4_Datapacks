# @s = lightning rod item on the ground

execute if entity @s[tag=gm4_lightning_rod_boom] run function gm4_lightning_rods:boom

data merge entity @s[tag=gm4_lightning_rod_count_1] {CustomName:'{"text":"<1>","color":"red"}',Tags:[gm4_lightning_rod_boom,gm4_lightning_rod_counting]}
data merge entity @s[tag=gm4_lightning_rod_count_2] {CustomName:'{"text":"<2>","color":"gold"}',Tags:[gm4_lightning_rod_count_1,gm4_lightning_rod_counting]}
data merge entity @s[tag=!gm4_lightning_rod_counting] {CustomName:'{"text":"<3>","color":"gold"}',CustomNameVisible:1b,Tags:[gm4_lightning_rod_count_2,gm4_lightning_rod_counting]}

playsound ui.button.click block @a[distance=..10] ~ ~ ~ .5 2
