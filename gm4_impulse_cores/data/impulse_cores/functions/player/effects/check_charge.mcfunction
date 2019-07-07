#checks charge for effects
#@s - player holding impulse core with enchanted iron armour
#called by impulse_cores:player/has_armour

execute if entity @s[nbt={Inventory:[{Slot:-106b,tag:{gm4_impulse_cores:{charge:1}}}]}] run function impulse_cores:player/effects/tier/1
execute if entity @s[nbt={Inventory:[{Slot:-106b,tag:{gm4_impulse_cores:{charge:2}}}]}] run function impulse_cores:player/effects/tier/2
execute if entity @s[nbt={Inventory:[{Slot:-106b,tag:{gm4_impulse_cores:{charge:3}}}]}] run function impulse_cores:player/effects/tier/3
execute if entity @s[nbt={Inventory:[{Slot:-106b,tag:{gm4_impulse_cores:{charge:4}}}]}] run function impulse_cores:player/effects/tier/4
execute if entity @s[nbt={Inventory:[{Slot:-106b,tag:{gm4_impulse_cores:{charge:5}}}]}] run function impulse_cores:player/effects/tier/5
