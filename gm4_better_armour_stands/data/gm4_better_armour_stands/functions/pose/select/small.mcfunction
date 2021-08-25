# @s = armor_stand to be modified
# at @s
# run from pose/select

summon minecraft:turtle ~ ~ ~ {Tags:["gm4_bas_detect_part","gm4_bas_base","gm4_bas_temp"],NoAI:1b,Silent:1b,Health:1f,Age:-100000}

summon minecraft:rabbit ~ ~.75 ~ {Tags:["gm4_bas_detect_part","gm4_bas_head","gm4_bas_temp"],NoAI:1b,Silent:1b,Health:1f,Age:-100000}
summon minecraft:rabbit ~ ~.5 ~ {Tags:["gm4_bas_detect_part","gm4_bas_body","gm4_bas_temp"],NoAI:1b,Silent:1b,Health:1f,Age:-100000}

execute positioned ~ ~.5 ~ run summon minecraft:rabbit ^.19 ^ ^ {Tags:["gm4_bas_detect_part","gm4_bas_left_arm","gm4_bas_temp"],NoAI:1b,Silent:1b,Health:1f,Age:-100000}
execute positioned ~ ~.5 ~ run summon minecraft:rabbit ^-.19 ^ ^ {Tags:["gm4_bas_detect_part","gm4_bas_right_arm","gm4_bas_temp"],NoAI:1b,Silent:1b,Health:1f,Age:-100000}
execute positioned ~ ~.19 ~ run summon minecraft:rabbit ^.1 ^ ^ {Tags:["gm4_bas_detect_part","gm4_bas_left_leg","gm4_bas_temp"],NoAI:1b,Silent:1b,Health:1f,Age:-100000}
execute positioned ~ ~.19 ~ run summon minecraft:rabbit ^-.1 ^ ^ {Tags:["gm4_bas_detect_part","gm4_bas_right_leg","gm4_bas_temp"],NoAI:1b,Silent:1b,Health:1f,Age:-100000}
