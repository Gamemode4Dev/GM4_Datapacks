execute as @a[gamemode=!spectator,gamemode=!creative] run function gm4_heart_canisters:player

# fix broken items
execute as @e[type=item,nbt={Item:{id:"minecraft:player_head",tag:{SkullOwner:{Id:[I;1567268555,400377645,-2090593244,-1749540666]}}}}] run data merge entity @s {Item:{tag:{CustomModelData:7,gm4_heart_canister:1b,gm4_heart_canister_tier:1b,display:{Lore:['{"translate":"%1$s%3427655$s","with":["Tier 1",{"translate":"item.gm4.heart_canister.lore.tier","with":["1"]}],"italic":false,"color":"gray"}'],Name:'{"translate":"%1$s%3427655$s","with":["Heart Canister",{"translate":"item.gm4.heart_canister"}],"italic":false}'}}}}
execute as @e[type=item,nbt={Item:{id:"minecraft:player_head",tag:{SkullOwner:{Id:[I;-320501529,-244889622,-2022276390,-292592904]}}}}] run data merge entity @s {Item:{tag:{CustomModelData:8,gm4_heart_canister:1b,gm4_heart_canister_tier:2b,display:{Lore:['{"translate":"%1$s%3427655$s","with":["Tier 2",{"translate":"item.gm4.heart_canister.lore.tier","with":["2"]}],"italic":false,"color":"gray"}'],Name:'{"translate":"%1$s%3427655$s","with":["Heart Canister",{"translate":"item.gm4.heart_canister"}],"italic":false}'}}}}

schedule function gm4_heart_canisters:main 16t
