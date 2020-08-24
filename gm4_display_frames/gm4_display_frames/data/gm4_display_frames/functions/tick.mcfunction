# check for thrown splash/lingering potions of invisibility
execute as @e[type=potion,predicate=gm4_display_frames:invisibility_potion] at @s run function gm4_display_frames:spawn_aec

schedule function gm4_display_frames:tick 1t
