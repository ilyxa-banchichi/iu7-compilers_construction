from graphviz import Digraph

def parse_tree_to_dot(input_str, output_file='parse_tree'):
    dot = Digraph()
    dot.attr('node', shape='box', fontname='Arial', fontsize='10')
    dot.attr('edge', fontname='Arial', fontsize='8')

    node_counter = [0]

    def parse_node(parent_id, node_str):
        node_str = node_str.strip()
        if not node_str:
            return

        parts = []
        current = []
        bracket_depth = 0
        
        for char in node_str:
            if char == '(':
                bracket_depth += 1
                if bracket_depth == 1:
                    if current:
                        parts.append(''.join(current).strip())
                    current = []
                else:
                    current.append(char)
            elif char == ')':
                bracket_depth -= 1
                if bracket_depth == 0:
                    if current:
                        parts.append('(' + ''.join(current) + ')')
                    current = []
                else:
                    current.append(char)
            elif char == ' ' and bracket_depth == 0:
                if current:
                    parts.append(''.join(current))
                    current = []
            else:
                current.append(char)
        
        if current:
            parts.append(''.join(current))

        if not parts:
            return

        node_name = parts[0]
        rest_parts = parts[1:]

        if not rest_parts and node_name.endswith('_tail'):
            return

        node_id = f'n{node_counter[0]}'
        node_counter[0] += 1
        dot.node(node_id, label=node_name)

        if parent_id is not None:
            dot.edge(parent_id, node_id)

        for part in rest_parts:
            if part.startswith('('):
                parse_node(node_id, part[1:-1])
            else:
                value_id = f'n{node_counter[0]}'
                node_counter[0] += 1
                dot.node(value_id, label=part)
                dot.edge(node_id, value_id)

    input_str = input_str.strip().replace('\n', ' ')
    parse_node(None, input_str[1:-1])

    dot.render(output_file, format='svg', cleanup=True)
    return dot