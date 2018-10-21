#@s = player who has punched a note block
#runs from nbi:pulse_check

#resets click scores
scoreboard players reset @s gm4_nbi_punch
#sets raycast limit
scoreboard players set @s gm4_nbi_ray 500
#runs raycast loops
execute anchored eyes positioned ^ ^ ^ anchored feet run function nbi:punch/loop