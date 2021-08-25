# @s = armor_stand to be modified
# at @s
# run from pose/select

summon minecraft:axolotl ~ ~-.2 ~ {CustomName:'"gm4_bas_detect_base"',Tags:["gm4_bas_detect_part","gm4_bas_base","gm4_bas_temp"],NoAI:1b,Silent:1b,Health:1f}

summon minecraft:chicken ~ ~1.5 ~ {CustomName:'"gm4_bas_detect_head"',Tags:["gm4_bas_detect_part","gm4_bas_head","gm4_bas_temp"],NoAI:1b,Silent:1b,Health:1f,Age:-100000}
summon minecraft:rabbit ~ ~1.25 ~ {CustomName:'"gm4_bas_detect_body"',Tags:["gm4_bas_detect_part","gm4_bas_body","gm4_bas_temp"],NoAI:1b,Silent:1b,Health:1f,Age:-100000}

execute positioned ~ ~1.25 ~ run summon minecraft:rabbit ^.285 ^ ^ {CustomName:'"gm4_bas_detect_left_arm"',Tags:["gm4_bas_detect_part","gm4_bas_left_arm","gm4_bas_temp"],NoAI:1b,Silent:1b,Health:1f,Age:-100000}
execute positioned ~ ~1.25 ~ run summon minecraft:rabbit ^-.285 ^ ^ {CustomName:'"gm4_bas_detect_right_arm"',Tags:["gm4_bas_detect_part","gm4_bas_right_arm","gm4_bas_temp"],NoAI:1b,Silent:1b,Health:1f,Age:-100000}
execute positioned ~ ~.525 ~ run summon minecraft:chicken ^.125 ^ ^ {CustomName:'"gm4_bas_detect_left_leg"',Tags:["gm4_bas_detect_part","gm4_bas_left_leg","gm4_bas_temp"],NoAI:1b,Silent:1b,Health:1f,Age:-100000}
execute positioned ~ ~.525 ~ run summon minecraft:chicken ^-.125 ^ ^ {CustomName:'"gm4_bas_detect_right_leg"',Tags:["gm4_bas_detect_part","gm4_bas_right_leg","gm4_bas_temp"],NoAI:1b,Silent:1b,Health:1f,Age:-100000}
