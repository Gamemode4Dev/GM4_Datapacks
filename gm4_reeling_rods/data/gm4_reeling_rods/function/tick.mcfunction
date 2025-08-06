# checks if players have cast a line, then will assign ids to entities around bobber
execute as @a[scores={gm4_reeling_rods.rods_cast=1..}] run function gm4_reeling_rods:player/cast_line

# 5 ticks is good enough response time
schedule function gm4_reeling_rods:tick 5t
