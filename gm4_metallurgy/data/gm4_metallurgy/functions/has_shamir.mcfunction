# @s = player with an active shamir in their inventory
# run from main

# defuse
execute if entity @s[nbt={Inventory:[{tag:{gm4_metallurgy:{active_shamir:"defuse"}}}]}] run function gm4_defuse_shamir:active

# spiraculum
execute if entity @s[nbt={SelectedItem:{tag:{gm4_metallurgy:{active_shamir:"spiraculum"}}}}] run function gm4_spiraculum_shamir:active
execute if entity @s[tag=!gm4_has_spiraculum,nbt={Inventory:[{Slot:-106b,tag:{gm4_metallurgy:{active_shamir:"spiraculum"}}}]}] run function gm4_spiraculum_shamir:active

# arborenda
execute store success score arborenda_active gm4_ml_data run tag @s[nbt={SelectedItem:{tag:{gm4_metallurgy:{active_shamir:"arborenda"}}}}] add gm4_has_arborenda

# conduction
execute if entity @s[nbt={SelectedItem:{tag:{gm4_metallurgy:{active_shamir:"conduction"}}}}] run function gm4_conduction_shamir:active
execute if entity @s[tag=!gm4_has_conduction,nbt={Inventory:[{Slot:-106b,tag:{gm4_metallurgy:{active_shamir:"conduction"}}}]}] run function gm4_conduction_shamir:active

# tinker
execute if entity @s[nbt={SelectedItem:{tag:{gm4_metallurgy:{active_shamir:"tinker"}}}}] run function gm4_tinker_shamir:active

# hypexperia
execute store success score hypexperia_active gm4_ml_data run tag @s[nbt={SelectedItem:{tag:{gm4_metallurgy:{active_shamir:"hypexperia"}}}}] add gm4_has_hypexperia
execute if score hypexperia_active gm4_ml_data matches 0 store success score hypexperia_active gm4_ml_data run tag @s[nbt={Inventory:[{Slot:-106b,tag:{gm4_metallurgy:{active_shamir:"hypexperia"}}}]}] add gm4_has_hypexperia

# forterra
execute store success score forterra_active gm4_ml_data run tag @s[nbt={SelectedItem:{tag:{gm4_metallurgy:{active_shamir:"forterra"}}}}] add gm4_has_forterra

# musical
execute if entity @s[scores={gm4_note_collect=1..},nbt={SelectedItem:{tag:{gm4_metallurgy:{active_shamir:"musical"}}}}] run function gm4_musical_shamir:active

# sensus
execute if entity @s[nbt={SelectedItem:{tag:{gm4_metallurgy:{active_shamir:"sensus"}}}}] at @s run function gm4_sensus_shamir:active
execute if entity @s[tag=!gm4_has_sensus,nbt={Inventory:[{Slot:-106b,tag:{gm4_metallurgy:{active_shamir:"sensus"}}}]}] at @s run function gm4_sensus_shamir:active

# levity
execute if entity @s[nbt={Inventory:[{Slot:100b,tag:{gm4_metallurgy:{active_shamir:"levity"}}}]}] run function gm4_levity_shamir:active
