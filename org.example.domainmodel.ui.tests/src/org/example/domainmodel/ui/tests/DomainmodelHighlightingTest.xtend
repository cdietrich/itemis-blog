package org.example.domainmodel.ui.tests

import com.google.inject.Inject
import org.eclipse.xtext.testing.InjectWith
import org.eclipse.xtext.testing.XtextRunner
import org.eclipse.xtext.ui.editor.syntaxcoloring.DefaultHighlightingConfiguration
import org.eclipse.xtext.ui.testing.AbstractHighlightingTest
import org.junit.Test
import org.junit.runner.RunWith

@RunWith(XtextRunner)
@InjectWith(DomainmodelUiInjectorProvider)
class DomainmodelHighlightingTest extends AbstractHighlightingTest {

	@Inject extension DefaultHighlightingConfiguration

	@Test def datatype_keyword() {
		'''
			datatype String
		'''.testHighlighting("datatype", keywordTextStyle)
	}

	@Test def entity_keyword() {
		'''
			entity Blog {
				
			}
		'''.testHighlighting("entity", keywordTextStyle)
	}

	@Test def many_keyword() {
		'''
			entity Blog {
				many posts: Post
			}
			
			entity Post {}
		'''.testHighlighting("many", keywordTextStyle)
	}

	@Test def extends_keyword() {
		'''
			entity HasAuthor {
			}
			
			entity Post extends HasAuthor {
			}
		'''.testHighlighting("extends", keywordTextStyle)
	}

	@Test def single_line_comment() {
		'''
			datatype String // used for features holding text values
		'''.testHighlighting("used for features holding text values", commentTextStyle)
	}

	@Test def multi_line_comment() {
		'''
			/*
			 * An entity consisting of
			 * 
			 * one title
			 * zero or more posts
			 */
			entity Blog {
				title: String
				many posts: Post
			}
		'''.testHighlighting('''
			/*
			 * An entity consisting of
			 * 
			 * one title
			 * zero or more posts
			 */
		''', commentTextStyle)
	}
}
