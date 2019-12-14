#run from metallurgy:pulse_check
#@s = none

execute as @a[tag=gm4_has_hypexperia] at @s as @e[type=experience_orb,distance=..5,tag=!gm4_doubled_xp,limit=1,sort=nearest] at @s run function gm4_hypexperia_shamir:double_xp
