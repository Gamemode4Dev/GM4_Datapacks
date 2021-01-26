#@s = any player who has a soul shard or orb of ankou in their offhand
#run from update_tags/check_offhand

tag @s add gm4_has_pneuma

tag @s[nbt={Inventory:[{Slot:-106b,tag:{gm4_orb_of_ankou:{pneumas:[{id:"incombustible"}]}}}]}] add gm4_pneuma_incombustible
tag @s[nbt={Inventory:[{Slot:-106b,tag:{gm4_orb_of_ankou:{pneumas:[{id:"retreating"}]}}}]}] add gm4_pneuma_retreating
tag @s[nbt={Inventory:[{Slot:-106b,tag:{gm4_orb_of_ankou:{pneumas:[{id:"aggressive"}]}}}]}] add gm4_pneuma_aggressive
tag @s[nbt={Inventory:[{Slot:-106b,tag:{gm4_orb_of_ankou:{pneumas:[{id:"withering"}]}}}]}] add gm4_pneuma_withering
tag @s[nbt={Inventory:[{Slot:-106b,tag:{gm4_orb_of_ankou:{pneumas:[{id:"volatile"}]}}}]}] add gm4_pneuma_volatile
tag @s[nbt={Inventory:[{Slot:-106b,tag:{gm4_orb_of_ankou:{pneumas:[{id:"neutralizing"}]}}}]}] add gm4_pneuma_neutralizing
tag @s[nbt={Inventory:[{Slot:-106b,tag:{gm4_orb_of_ankou:{pneumas:[{id:"bubbly"}]}}}]}] add gm4_pneuma_bubbly
tag @s[nbt={Inventory:[{Slot:-106b,tag:{gm4_orb_of_ankou:{pneumas:[{id:"vanishing"}]}}}]}] add gm4_pneuma_vanishing
tag @s[nbt={Inventory:[{Slot:-106b,tag:{gm4_orb_of_ankou:{pneumas:[{id:"blinding"}]}}}]}] add gm4_pneuma_blinding
tag @s[nbt={Inventory:[{Slot:-106b,tag:{gm4_orb_of_ankou:{pneumas:[{id:"feathery"}]}}}]}] add gm4_pneuma_feathery
tag @s[nbt={Inventory:[{Slot:-106b,tag:{gm4_orb_of_ankou:{pneumas:[{id:"gazing"}]}}}]}] add gm4_pneuma_gazing
tag @s[nbt={Inventory:[{Slot:-106b,tag:{gm4_orb_of_ankou:{pneumas:[{id:"agile"}]}}}]}] add gm4_pneuma_agile
tag @s[nbt={Inventory:[{Slot:-106b,tag:{gm4_orb_of_ankou:{pneumas:[{id:"gliding"}]}}}]}] add gm4_pneuma_gliding
tag @s[nbt={Inventory:[{Slot:-106b,tag:{gm4_orb_of_ankou:{pneumas:[{id:"lifeless"}]}}}]}] add gm4_pneuma_lifeless
tag @s[nbt={Inventory:[{Slot:-106b,tag:{gm4_orb_of_ankou:{pneumas:[{id:"scaling"}]}}}]}] add gm4_pneuma_scaling
tag @s[nbt={Inventory:[{Slot:-106b,tag:{gm4_orb_of_ankou:{pneumas:[{id:"bounding"}]}}}]}] add gm4_pneuma_bounding
tag @s[nbt={Inventory:[{Slot:-106b,tag:{gm4_orb_of_ankou:{pneumas:[{id:"phasing"}]}}}]}] add gm4_pneuma_phasing
tag @s[nbt={Inventory:[{Slot:-106b,tag:{gm4_orb_of_ankou:{pneumas:[{id:"rushing"}]}}}]}] add gm4_pneuma_rushing
tag @s[nbt={Inventory:[{Slot:-106b,tag:{gm4_orb_of_ankou:{pneumas:[{id:"conjuring"}]}}}]}] add gm4_pneuma_conjuring
tag @s[nbt={Inventory:[{Slot:-106b,tag:{gm4_orb_of_ankou:{pneumas:[{id:"expeditious"}]}}}]}] add gm4_pneuma_expeditious
tag @s[nbt={Inventory:[{Slot:-106b,tag:{gm4_orb_of_ankou:{pneumas:[{id:"bargaining"}]}}}]}] add gm4_pneuma_bargaining
tag @s[nbt={Inventory:[{Slot:-106b,tag:{gm4_orb_of_ankou:{pneumas:[{id:"soaring"}]}}}]}] add gm4_pneuma_soaring
tag @s[nbt={Inventory:[{Slot:-106b,tag:{gm4_orb_of_ankou:{pneumas:[{id:"synergetic"}]}}}]}] add gm4_pneuma_synergetic
tag @s[nbt={Inventory:[{Slot:-106b,tag:{gm4_orb_of_ankou:{pneumas:[{id:"hawkeye"}]}}}]}] add gm4_pneuma_hawkeye
tag @s[nbt={Inventory:[{Slot:-106b,tag:{gm4_orb_of_ankou:{pneumas:[{id:"draining"}]}}}]}] add gm4_pneuma_draining
tag @s[nbt={Inventory:[{Slot:-106b,tag:{gm4_orb_of_ankou:{pneumas:[{id:"blasting"}]}}}]}] add gm4_pneuma_blasting
tag @s[nbt={Inventory:[{Slot:-106b,tag:{gm4_orb_of_ankou:{pneumas:[{id:"striding"}]}}}]}] add gm4_pneuma_striding

tag @s[tag=gm4_pneuma_bounding] add gm4_sneak_pneuma
tag @s[tag=gm4_pneuma_rushing] add gm4_sneak_pneuma
tag @s[tag=gm4_pneuma_conjuring] add gm4_sneak_pneuma
tag @s[tag=gm4_pneuma_expeditious] add gm4_sneak_pneuma
tag @s[tag=gm4_pneuma_draining] add gm4_sneak_pneuma
