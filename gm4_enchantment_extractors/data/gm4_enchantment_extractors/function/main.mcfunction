# process machine
execute as @e[type=marker,tag=gm4_enchantment_extractor] at @s run function gm4_enchantment_extractors:process

schedule function gm4_enchantment_extractors:main 16t
