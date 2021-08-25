# @s = armor_stand to be modified
# at @s
# run from pose/select

summon minecraft:chicken ~ ~1.5 ~ {CustomName:'"gm4_bas_detect_head"',Tags:["gm4_bas_detect_part","gm4_bas_head","gm4_bas_temp"],NoAI:1b,Silent:1b,Health:1f,Age:-100000}

execute positioned ~ ~1.25 ~ run summon minecraft:rabbit ^.285 ^ ^ {CustomName:'"gm4_bas_detect_left_arm"',Tags:["gm4_bas_detect_part","gm4_bas_left_arm","gm4_bas_temp"],NoAI:1b,Silent:1b,Health:1f,Age:-100000}
execute positioned ~ ~1.25 ~ run summon minecraft:rabbit ^-.285 ^ ^ {CustomName:'"gm4_bas_detect_right_arm"',Tags:["gm4_bas_detect_part","gm4_bas_right_arm","gm4_bas_temp"],NoAI:1b,Silent:1b,Health:1f,Age:-100000}
