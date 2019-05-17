#run from breed_pig.json (advancement)
#@s = player who has bred a mob

execute if entity @s[nbt={SelectedItem:{tag:{gm4_metallurgy:{active_shamir:"gemini"}}}}] as @e[distance=..10,type=pig,limit=1,sort=nearest,nbt=!{InLove:0}] at @s run function gemini_shamir:breed/pig
execute if entity @s[nbt={Inventory:[{Slot:-106b,tag:{gm4_metallurgy:{active_shamir:"gemini"}}}]},nbt=!{SelectedItem:{tag:{gm4_metallurgy:{active_shamir:"gemini"}}}}] as @e[distance=..10,type=pig,limit=1,sort=nearest,nbt=!{InLove:0}] at @s run function gemini_shamir:breed/pig

advancement revoke @s only gemini_shamir:breed_pig
