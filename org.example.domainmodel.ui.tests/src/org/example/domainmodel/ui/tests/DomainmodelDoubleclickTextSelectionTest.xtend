package org.example.domainmodel.ui.tests

import org.eclipse.xtext.testing.InjectWith
import org.eclipse.xtext.testing.XtextRunner
import org.eclipse.xtext.ui.XtextProjectHelper
import org.eclipse.xtext.ui.testing.AbstractEditorDoubleClickTextSelectionTest
import org.junit.Test
import org.junit.runner.RunWith

import static extension org.eclipse.xtext.ui.testing.util.IResourcesSetupUtil.addNature

@RunWith(XtextRunner)
@InjectWith(DomainmodelUiInjectorProvider)
class DomainmodelDoubleclickTextSelectionTest extends AbstractEditorDoubleClickTextSelectionTest {

	@Test def datatype_keyword() {
		'''
			datatype«c» String
		'''.assertSelectedTextAfterDoubleClicking("datatype")
	}

	@Test def single_line_comment() {
		'''
			datatype String // used «c»for features holding text values
		'''.assertSelectedTextAfterDoubleClicking("for")
	}

	@Test def multi_line_comment() {
		'''
			/*
			 * An entity consisting of
			 * 
			 * one ti«c»tle
			 * zero or more posts
			 */
			entity Blog {
				title: String
				many posts: Post
			}
		'''.assertSelectedTextAfterDoubleClicking("title")
	}

	override protected createFile(String content) {
		val file = super.createFile(content)
		file.project.addNature(XtextProjectHelper.NATURE_ID)
		file
	}
}