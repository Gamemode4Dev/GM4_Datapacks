#run from main
#@s = as and at drawer with acceptable upgrade

scoreboard players set @s gm4_sd_max 7168
kill @e[type=item, limit=1, sort=nearest, distance=..1, nbt={gm4_storage_drawers_upgrade_emerald:1b}]
scoreboard players add @s gm4_sd_upgrade 1