# update vanilla shields
# @s = player using a shield
# at @s
# run from advancement using_vanilla_shield

# in order for shields to work with the module we add custom_data gm4_survival_refightalized:{shield:{}}, optionally with parry_ticks
# parry_ticks indicates the ticks after the shield is raised that the attack must be blocked for the attack to be considered a parry
# the vanilla blocks_attacks is also copied into the item, with the exception that block_delay_seconds is set to 0.0

# offhand
execute if entity @s[advancements={gm4_survival_refightalized:using_vanilla_shield={offhand=true}}] run item modify entity @s weapon.offhand {function:"set_components",components:{\
"custom_data":\
    {"gm4_survival_refightalized":{\
        "shield":{\
            "parry_ticks":5\
}}},\
"minecraft:blocks_attacks": {\
      "block_delay_seconds": 0.0,\
      "disable_cooldown_scale": 1,\
      "block_sound": "minecraft:item.shield.block",\
      "bypassed_by": "#minecraft:bypasses_shield",\
      "disabled_sound": "minecraft:item.shield.break",\
      "item_damage": {\
        "base": 1.0,\
        "factor": 1.0,\
        "threshold": 3.0\
}}}}

# mainhand
execute if entity @s[advancements={gm4_survival_refightalized:using_vanilla_shield={mainhand=true}}] run item modify entity @s weapon.mainhand {function:"set_components",components:{\
"custom_data":\
    {"gm4_survival_refightalized":{\
        "shield":{\
            "parry_ticks":5\
}}},\
"minecraft:blocks_attacks": {\
      "block_delay_seconds": 0.0,\
      "disable_cooldown_scale": 1,\
      "block_sound": "minecraft:item.shield.block",\
      "bypassed_by": "#minecraft:bypasses_shield",\
      "disabled_sound": "minecraft:item.shield.break",\
      "item_damage": {\
        "base": 1.0,\
        "factor": 1.0,\
        "threshold": 3.0\
}}}}

# revoke advancement
advancement revoke @s only gm4_survival_refightalized:using_vanilla_shield
