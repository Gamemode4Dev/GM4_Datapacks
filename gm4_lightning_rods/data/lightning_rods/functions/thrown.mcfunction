# @s = lightning rod item on the ground

execute if entity @s[tag=gm4_lightning_rod_boom] run function lightning_rods:boom

data merge entity @s[tag=gm4_lightning_rod_count_1] {CustomName:"\"<1>\"",Tags:[gm4_lightning_rod_boom,gm4_lightning_rod_counting]}
data merge entity @s[tag=gm4_lightning_rod_count_2] {CustomName:"\"<2>\"",CustomNameVisible:true,Tags:[gm4_lightning_rod_count_1,gm4_lightning_rod_counting]}
data merge entity @s[tag=!gm4_lightning_rod_counting] {CustomName:"\"<3>\"",CustomNameVisible:1b,Tags:[gm4_lightning_rod_count_2,gm4_lightning_rod_counting]}

playsound ui.button.click block @a[distance=..10] ~ ~ ~ .5 2
