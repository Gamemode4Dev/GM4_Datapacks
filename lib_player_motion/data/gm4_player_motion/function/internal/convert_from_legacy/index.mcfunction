# Index into the correct bucket
$function gm4_player_motion:internal/convert_from_legacy/bucket/$(index)
# Restore sign to impulse output & return its value
return run scoreboard players operation #crystal gm4_player_motion.internal.dummy *= #sign gm4_player_motion.internal.dummy
