# the player let go of right click this tick, so try to blast
execute as @a[scores={gm4_blast_charging=1}] at @s run function gm4_blasting_maces:player/release
scoreboard players remove @a[scores={gm4_blast_charging=1..}] gm4_blast_charging 1

# reschedule
schedule function gm4_blasting_maces:tick 1t
