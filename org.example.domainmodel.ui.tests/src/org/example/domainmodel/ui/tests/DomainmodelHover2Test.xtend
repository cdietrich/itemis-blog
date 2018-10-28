package org.example.domainmodel.ui.tests

import com.google.inject.Inject
import org.eclipse.xtext.testing.InjectWith
import org.eclipse.xtext.testing.XtextRunner
import org.example.domainmodel.tests.utils.UMLResourceSetHelper
import org.junit.Test
import org.junit.runner.RunWith
import org.eclipse.jface.text.Region
import org.eclipse.xtext.ui.testing.AbstractHoverTest

@RunWith(XtextRunner)
@InjectWith(DomainmodelUiInjectorProvider)
class DomainmodelHover2Test extends AbstractHoverTest {

	@Inject extension UMLResourceSetHelper

	override protected dslFile(CharSequence content) {
		val dslFile = super.dslFile(content)
		initializeResourceSet(dslFile.project.fullPath.toString)
		dslFile
	}

	@Test def hover_over_uml_class1() {
		'''
			entity UML {
				a : test.A
				b : test.B
			}
		'''.hasHoverOver("test.A", '''Class <b>A</b>''')
	}

	@Test def hover_over_uml_class2() {
		'''
			entity UML {
				a : test.A
				b : test.B
			}
		'''.hasHoverOver("test.B", '''Class <b>B</b>''')
	}

	override hasHoverOver(CharSequence it, String hoverText, String hoverContent) {
		hasHoverOver(new Region(toString.lastIndexOf(hoverText), hoverText.length), hoverContent)
	}
}