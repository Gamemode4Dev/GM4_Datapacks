from beet import Context, Function, Advancement, Structure
from typing import Dict, List
from dataclasses import dataclass

NAMESPACE = 'gm4_double_doors'
TEMPLATE_FOLDER = 'template'
TEMPLATE_PLACEHOLDER = '$material_name$'


@dataclass
class Clone:
    name: str

    advancements: Dict[str, Advancement]
    functions: Dict[str, Function]
    structures: Dict[str, Structure]


def beet_default(ctx: Context):

    # list of supported wood types. Add new wood types here.
    material_names: List[str] = ['acacia', 'bamboo', 'birch', 'cherry', 'crimson', 'dark_oak', 'jungle', 'mangrove', 'oak', 'spruce', 'warped']
    build_output_data_pack(ctx, material_names)


def build_output_data_pack(ctx: Context, material_names: List[str]):
    """Builds the data pack to be pushed to the output"""

    # create clones of template
    clones: List[Clone] = []
    for material_name in material_names:
        clones.append(clone_template(ctx, material_name))

    # remove template (template will not appear in the output, but stays in the input)
    ctx.data.advancements.clear()
    ctx.data.functions.clear()
    ctx.data.structures.clear()

    # re-build datapack based on clones
    for clone in clones:
        merge_clone(ctx, clone)


def clone_template(ctx: Context, material_name: str) -> Clone:
    """Clones the template consisting of a trigger advancement, functions, and structures and replaces all mentions of TEMPLATE_PLACEHOLDER with material_name."""

    # clone advancements
    cloned_advancements: Dict[str, Advancement] = {}
    for advancement_path in ctx.data.advancements.match(f'{NAMESPACE}:{TEMPLATE_FOLDER}/*'):
        advancement = ctx.data.advancements.get(advancement_path)
        if advancement is None:
            continue

        # save clone populated with altered version of template
        cloned_advancements[advancement_path.replace(TEMPLATE_FOLDER, material_name)] = Advancement(
            advancement.get_content().replace(TEMPLATE_PLACEHOLDER, material_name))

    # clone functions
    cloned_functions: Dict[str, Function] = {}
    for function_path in ctx.data.functions.match(f'{NAMESPACE}:{TEMPLATE_FOLDER}/*'):
        function = ctx.data.functions.get(function_path)
        if function is None:
            continue

        # save clone populated with altered version of template
        cloned_functions[function_path.replace(TEMPLATE_FOLDER, material_name)] = Function(
            function.get_content().replace(TEMPLATE_PLACEHOLDER, material_name))

    # clone structures
    cloned_structures: Dict[str, Structure] = {}
    for structure_path in ctx.data.structures.match(f'{NAMESPACE}:{TEMPLATE_FOLDER}/*'):
        structure = ctx.data.structures.get(structure_path)
        if structure is None:
            continue

        # save clone populated with altered version of template (copy is required to avoid overwriting the template)
        cloned_structures[structure_path.replace(TEMPLATE_FOLDER, material_name)] = set_structure_palette(structure.copy(), material_name)

    return Clone(material_name, cloned_advancements, cloned_functions, cloned_structures)


def merge_clone(ctx: Context, clone: Clone):
    """Merges the provided clone with the context."""

    ctx.data.advancements.merge(clone.advancements)
    ctx.data.functions.merge(clone.functions)
    ctx.data.structures.merge(clone.structures)


def set_structure_palette(structure: Structure, material_name: str) -> Structure:
    """Searches through a structure file and replaces all mentions of TEMPLATE_PLACEHOLDER in the block type of a palette entry with material_name."""

    # look through the structure file's contents for blocks which have TEMPLATE_PLACEHOLDER as their name
    for block_state in structure.ensure_deserialized()['palette']:
        block_state['Name'] = block_state['Name'].replace(TEMPLATE_PLACEHOLDER, material_name)

    # reserialize
    structure.ensure_serialized()
    return structure
