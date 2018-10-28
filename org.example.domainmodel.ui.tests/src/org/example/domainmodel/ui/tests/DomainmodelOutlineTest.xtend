package org.example.domainmodel.ui.tests

import com.google.inject.Inject
import org.eclipse.xtext.testing.InjectWith
import org.eclipse.xtext.testing.XtextRunner
import org.eclipse.xtext.ui.editor.XtextEditorInfo
import org.eclipse.xtext.ui.testing.AbstractOutlineTest
import org.junit.Test
import org.junit.runner.RunWith

@RunWith(XtextRunner)
@InjectWith(DomainmodelUiInjectorProvider)
class DomainmodelOutlineTest extends AbstractOutlineTest {

	@Inject XtextEditorInfo editorInfo

	override protected getEditorId() {
		editorInfo.editorId
	}

	@Test def outline_view_content() {
		'''
			datatype String
			
			entity Blog {
				title: String
				many posts: Post
			}
			
			entity HasAuthor {
				author: String
			}
			
			entity Post extends HasAuthor {
				title: String
				content: String
				many comments: Comment
			}
			
			entity Comment extends HasAuthor {
				content: String
			}
		'''.assertAllLabels('''
			test
			  String
			  Blog
			    title
			    posts
			  HasAuthor
			    author
			  Post
			    title
			    content
			    comments
			  Comment
			    content
		''')
	}
}
