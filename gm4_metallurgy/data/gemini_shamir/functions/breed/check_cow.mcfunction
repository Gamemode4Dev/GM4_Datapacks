#run from breed_cow.json (advancement)
#@s = player who has bred a mob

execute if entity @s[nbt={SelectedItem:{tag:{gm4_metallurgy:{active_shamir:"gemini"}}}}] as @e[distance=..10,type=cow,limit=1,sort=nearest,nbt=!{InLove:0}] at @s run summon cow ~ ~ ~ {Age:-23999}
execute if entity @s[nbt={Inventory:[{Slot:-106b,tag:{gm4_metallurgy:{active_shamir:"gemini"}}}]},nbt=!{SelectedItem:{tag:{gm4_metallurgy:{active_shamir:"gemini"}}}}] as @e[distance=..10,type=cow,limit=1,sort=nearest,nbt=!{InLove:0}] at @s run summon cow ~ ~ ~ {Age:-23999}

advancement revoke @s only gemini_shamir:breed_cow
