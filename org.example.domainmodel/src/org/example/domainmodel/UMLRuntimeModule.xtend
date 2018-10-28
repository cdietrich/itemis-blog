package org.example.domainmodel

import org.eclipse.xtext.resource.generic.AbstractGenericResourceRuntimeModule

/**
 * This class is used to configure the runtime dependency injection (DI) container for the UML language.
 */
class UMLRuntimeModule extends AbstractGenericResourceRuntimeModule {

	override protected getFileExtensions() {
		'uml'
	}

	override protected getLanguageName() {
		UMLLanguageConstants.ORG_ECLIPSE_UML2_UML
	}

	override bindIQualifiedNameProvider() {
		UMLQualifiedNameProvider
	}
}
