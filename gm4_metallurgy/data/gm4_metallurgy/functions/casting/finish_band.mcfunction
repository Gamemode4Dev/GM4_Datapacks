# @s = mould requesting a band
# run from any function in casting/summon_band

#select a random item and kill others
tag @e[type=item,distance=..0.1,nbt={Age:0s,Item:{tag:{gm4_metallurgy:{has_shamir:1b}}}},sort=random,limit=1] add gm4_ml_selected_band
kill @e[type=item,tag=!gm4_ml_selected_band,distance=..0.1,nbt={Age:0s,Item:{tag:{gm4_metallurgy:{has_shamir:1b}}}}]

scoreboard players set band_applied gm4_ml_data 1
