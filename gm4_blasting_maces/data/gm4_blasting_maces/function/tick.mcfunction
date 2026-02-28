# manage tool component on maces (add when enchanted, remove when not)
execute as @a[predicate=gm4_blasting_maces:mace_needs_tool] run function gm4_blasting_maces:mace/add_tool_component
execute as @a[predicate=gm4_blasting_maces:mace_needs_tool_removed] run function gm4_blasting_maces:mace/remove_tool_component

# check players who used a mace for blasting enchantment
execute as @a[scores={gm4_blast_use_mace=1..}] run function gm4_blasting_maces:player/check_for_mace

# reschedule
schedule function gm4_blasting_maces:tick 1t
