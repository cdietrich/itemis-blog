package org.example.domainmodel.ui.tests

import org.eclipse.xtext.testing.InjectWith
import org.eclipse.xtext.testing.XtextRunner
import org.junit.Test
import org.junit.runner.RunWith
import org.eclipse.xtext.ui.testing.AbstractHoverTest

@RunWith(XtextRunner)
@InjectWith(DomainmodelUiInjectorProvider)
class DomainmodelHoverTest extends AbstractHoverTest {

	@Test def hover_over_entity_superType() {
		'''
			entity HasAuthor {}
			entity Post extends HasAuthor {}
		'''.hasHoverOver("HasAuthor", '''Entity <b>HasAuthor</b>''')
	}

	@Test def hover_over_feature_type() {
		'''
			datatype String
			
			entity Blog {
				title: String
			}
		'''.hasHoverOver("String", '''DataType <b>String</b>''')
	}
}