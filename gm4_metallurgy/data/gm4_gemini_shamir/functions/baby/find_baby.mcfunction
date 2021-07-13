# finds recently gemini bred animals
# scheduled from gm4_gemini_shamir:breed/check_*

execute as @e[type=marker,tag=gm4_gemini_bred] at @s run function gm4_gemini_shamir:baby/pick_type
