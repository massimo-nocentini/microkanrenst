
import docutils
from docutils.parsers.rst import Directive
from docutils.statemachine import ViewList
from sphinx.domains import Domain
from sphinx.roles import XRefRole
from sphinx.util.nodes import nested_parse_with_titles
from docutils.statemachine import StringList
import json

# for now hardcore absolute file reference.
with open('/Users/mn/Developer/snapshots/pharoes/90-microkanren/microkanren.json') as fp:
    pharoExportDict = json.load(fp)

class PharoDirective(Directive):

    required_arguments = 1
    optional_arguments = 0
    final_argument_whitespace = False
    option_spec = {}
    has_content = False

    def run(self):
        classDef = pharoExportDict['classes'][self.arguments[0]]

        rst = StringList()

        dummySourceFilename = '{}.rst'.format(self.arguments[0])
        for i, l in enumerate(classDef['comment']):
            rst.append(l, dummySourceFilename, i)

        node = docutils.nodes.section()
        node.document = self.state.document

        # Parse the rst.
        nested_parse_with_titles(self.state, rst, node)

        return node.children + [docutils.nodes.literal_block('', classDef['definition'], language='smalltalk')]

class PharoDomain(Domain):

    name = 'pharo'
    label = 'A Smalltalk domain'
    roles = {
        'ref': XRefRole()
    }
    directives = {
        'autoclass': PharoDirective,
    }
    indices = {
    }
    initial_data = {
        'classes': [],  # object list
        #'recipe_ingredients': {},  # name -> object
    }

    def get_full_qualified_name(self, node):
        return '{}.{}'.format('pharo', node.arguments[0])

    def get_objects(self):
        for obj in self.data['classes']:
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

    def add_autoclass(self, signature, ingredients):
        """Add a new autoclass to the domain."""
        name = '{}.{}'.format('pharo-class', signature)
        anchor = 'pharo-class-{}'.format(signature)

        # name, dispname, type, docname, anchor, priority
        self.data['classes'].append(
            (name, signature, 'Class', self.env.docname, anchor, 0))


def setup(app):
    app.add_config_value('pharo_json_export_filename', None, 'html')
    app.add_domain(PharoDomain)

    return {
        'version': '0.1',
        'parallel_read_safe': True,
        'parallel_write_safe': True,
    }
