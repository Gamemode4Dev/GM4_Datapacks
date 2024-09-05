# init a new bed marker
# @s = bed home marker
# at @s
# run from player/home/detect_sleep

data merge entity @s {Tags:["gm4_ce_bed"],CustomName:'{"text":"gm4_ce_bed_marker"}',data:{gm4_combat_expanded:{bed_users:[{uses:1,id:-1}]}}}
scoreboard players operation @s gm4_ce_id = $id gm4_ce_data
scoreboard players operation @s gm4_ce_sleep.version = $sleep_version gm4_ce_sleep.version
