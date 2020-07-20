execute as @a[gamemode=!spectator,gamemode=!creative] run function gm4_heart_canisters:player

# fix broken items
execute as @e[type=item,nbt={Item:{id:"minecraft:player_head",tag:{SkullOwner:{Id:"25b1ff93-7926-1cd7-53fe-8e6050792daa"}}}}] run data merge entity @s {Item:{tag:{CustomModelData:7,gm4_heart_canister:1b,gm4_heart_canister_tier:1b,display:{Lore:['{"translate":"%1$s%3427655$s","with":["Tier 1",{"translate":"item.gm4.heart_canister.lore.tier","with":["1"]}],"italic":false}'],Name:'{"translate":"%1$s%3427655$s","with":["Heart Canister",{"translate":"item.gm4.heart_canister"}],"italic":false}'}}}}
execute as @e[type=item,nbt={Item:{id:"minecraft:player_head",tag:{SkullOwner:{Id:"25b1ff93-7925-1cd7-53fe-8e6050792daa"}}}}] run data merge entity @s {gm4_heart_canister:1b,gm4_heart_canister_tier:2b,Item:{tag:{CustomModelData:8,display:{Lore:['{"translate":"%1$s%3427655$s","with":["Tier 2",{"translate":"item.gm4.heart_canister.lore.tier","with":["2"]}],"italic":false}'],Name:'{"translate":"%1$s%3427655$s","with":["Heart Canister",{"translate":"item.gm4.heart_canister"}],"italic":false}'}}}}

schedule function gm4_heart_canisters:main 16t
