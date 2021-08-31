# @s = armor_stand to be modified
# at @s
# run from pose/select

summon minecraft:chicken ~ ~1.5 ~ {Tags:["gm4_bas_detect_part","gm4_bas_head"],NoAI:1b,Silent:1b,Age:-100000}
execute positioned ~ ~1.25 ~ run summon minecraft:rabbit ^.285 ^ ^ {Tags:["gm4_bas_detect_part","gm4_bas_left_arm"],NoAI:1b,Silent:1b,Age:-100000}
execute positioned ~ ~1.25 ~ run summon minecraft:rabbit ^-.285 ^ ^ {Tags:["gm4_bas_detect_part","gm4_bas_right_arm"],NoAI:1b,Silent:1b,Age:-100000}
