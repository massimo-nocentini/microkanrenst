
import docutils
from docutils.parsers.rst import Directive
from docutils.statemachine import ViewList
from sphinx.domains import Domain
from sphinx.roles import XRefRole
from sphinx.util.nodes import nested_parse_with_titles
from sphinx import addnodes
from docutils.statemachine import StringList
import json

def doctree_resolved_handler(app,):#, fromdocname):

    # D will contain the whole content, collecting from each json file.
    D = {'classes': {}, 'messages': {}}

    for filename in app.config.pharo_json_export_filenames:
        with open(filename) as fp:
            d = json.load(fp)
            D['classes'] |= d['classes']
            D['messages'] |= d['messages']

    app.builder.env.pharo_json_export = D
    print('json loaded succeessfully, with {} messages and {} classes.'.format(
        len(D['messages']), len(D['classes'])))


class PharoAutoClassDirective(Directive):

    required_arguments = 1
    optional_arguments = 0
    final_argument_whitespace = False
    option_spec = {}
    has_content = True

    def run(self):
        
        pharo_json_export = self.state.document.settings.env.pharo_json_export

        className = self.arguments[0]
        classDef = pharo_json_export['classes'][className]
        classDef['description'] = [''] + [str(l) for l in self.content]

        rst = StringList()

        dummySourceFilename = '{}.rst'.format(className)
        for i, l in enumerate(classDef['description']):
            rst.append(l, dummySourceFilename, i)

        node = docutils.nodes.section()
        node.document = self.state.document

        # Parse the rst.
        nested_parse_with_titles(self.state, rst, node)

        #title_node = docutils.nodes.title(text=className, refid=className)
        definition_node = docutils.nodes.literal_block(text=classDef['definition'], language='smalltalk')

        return [definition_node] + node.children

class PharoAutoCompiledMethodDirective(Directive):

    required_arguments = 1
    optional_arguments = 0
    final_argument_whitespace = True
    option_spec = {}
    has_content = True

    def run(self):

        pharo_json_export = self.state.document.settings.env.pharo_json_export
                
        fullSelector = self.arguments[0]
        className, selector = fullSelector.split('>>')
        className = ' '.join(className.split('_'))
        fullSelector = '{}>>{}'.format(className, selector)
        messageDef = pharo_json_export['messages'][selector[1:]]
        compiled_method = messageDef['implementors'][className]
        compiled_method['description'] = [''] + ['  ' + str(s) for s in self.content]
        sourceCode = ['{} >> {} '.format(className, compiled_method['sourceCode'][0])] + compiled_method['sourceCode'][1:]
        #del compiled_method['sourceCode'][1]
        #compiled_method['sourceCode'].append(']')

        rst = StringList()

        dummySourceFilename = '{}.rst'.format(fullSelector)
        #rst.append('.. py:function:: {}({})'.format(
                      #fullSelector, ', '.join(compiled_method['argumentNames'])),
                   #dummySourceFilename, 0)
        for i, l in enumerate(compiled_method['description'], start=0):
            rst.append(l, dummySourceFilename, i)

        node = docutils.nodes.section()

        # Parse the rst.
        #nested_parse_with_titles(self.state, self.content, node)
        nested_parse_with_titles(self.state, rst, node)

        #title_node = docutils.nodes.title(text=className, refid=className)
        definition_node = docutils.nodes.literal_block(text=#'\n' + 
                            '\n'.join(sourceCode), language='smalltalk')

        indexnode = addnodes.index()
        indexnode['entries'] = [
            ('single', 'Protocol {}; {}'.format(compiled_method['category'], fullSelector), fullSelector, False, None)
        ]

        return [indexnode, definition_node] + node.children

        '''
        field_comment = docutils.nodes.field()
        field_comment += docutils.nodes.field_name(text='Comment')
        field_comment_body = docutils.nodes.field_body()
        field_comment_body += node
        field_comment += field_comment_body
        field_body = docutils.nodes.field()
        field_body += docutils.nodes.field_name(text='Body')
        field_body_body = docutils.nodes.field_body()
        field_body_body += definition_node
        field_body += field_body_body

        field_list_node = docutils.nodes.field_list()
        field_list_node += field_comment
        field_list_node += field_body

        return [field_list_node]
        '''

class PharoDomain(Domain):

    name = 'pharo'
    label = 'A Smalltalk domain'
    roles = {
        'ref': XRefRole()
    }
    directives = {
        'autoclass': PharoAutoClassDirective,
        'autocompiledmethod': PharoAutoCompiledMethodDirective,
    }
    indices = {
    }
    initial_data = {
        'classes': [],  # object list
        'compiledMethods': [],  # object list
    }

    def get_full_qualified_name(self, node):
        return '{}.{}'.format('pharo', node.arguments[0])

    def get_objects(self):
        for obj in self.data['classes']:
            yield(obj)
        for obj in self.data['compiledMethods']:
            yield(obj)

    def resolve_xref(self, env, fromdocname, builder, typ, target, node, contnode):
        match = [(docname, anchor)
                 for name, sig, typ, docname, anchor, prio
                 in self.get_objects() if sig == target]

        if len(match) > 0:
            todocname = match[0][0]
            targ = match[0][1]

            return make_refnode(builder, fromdocname, todocname, targ, contnode, targ)
        else:
            print('Awww, found nothing')
            return None

def setup(app):
    app.add_config_value('pharo_json_export_filenames', [], 'html')
    app.connect('builder-inited', doctree_resolved_handler)
    app.add_domain(PharoDomain)

    return {
        'version': '0.1',
        'parallel_read_safe': True,
        'parallel_write_safe': True,
    }
