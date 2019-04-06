#@s = none
#at world spawn
#run from expansion_selection/calculate_midnight_difficulty, only during full moon nights where there is a mysterious midnight. Only ran once.

#play wolf sound
playsound entity.wolf.howl weather @a ~ ~10000 ~ 0 1 1

#common
execute if score random gm4_nights_data matches 9..12 run function #mysterious_midnights:common_expansion
#uncommon
execute if score random gm4_nights_data matches 13..14 run function #mysterious_midnights:uncommon_expansion
#rare
execute if score random gm4_nights_data matches 15.. run function #mysterious_midnights:rare_expansion

#chose one expansion
tag @e[type=area_effect_cloud,tag=gm4_mysterious_midnights_expansion,limit=1,sort=random] add gm4_mysterious_midnights_active
kill @e[type=area_effect_cloud,tag=gm4_mysterious_midnights_expansion,tag=!gm4_mysterious_midnights_active]
