#@s = player who has punched a note block
#runs from nbi:pulse_check

#resets click scores
scoreboard players reset @s gm4_nbi_click
#sets raycast limit
scoreboard players set @s gm4_nbi_ray 500
#runs raycast loops
execute positioned ~ ~1.7 ~ if entity @s[dx=0] at @s anchored eyes positioned ^ ^ ^ anchored feet run function nbi:click/loop
execute positioned ~ ~1.7 ~ unless entity @s[dx=0] at @s anchored eyes positioned ^ ^ ^ anchored feet run function nbi:click/sneak_loop