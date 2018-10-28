package org.example.domainmodel.ui

import org.eclipse.xtext.ui.guice.AbstractGuiceAwareExecutableExtensionFactory
import org.example.domainmodel.ui.internal.DomainmodelActivatorEx
import org.example.domainmodel.UMLLanguageConstants

class UMLExecutableExtensionFactory extends AbstractGuiceAwareExecutableExtensionFactory {

	override protected getBundle() {
		DomainmodelActivatorEx.instance.bundle
	}

	override protected getInjector() {
		DomainmodelActivatorEx.instance.getInjector(UMLLanguageConstants.ORG_ECLIPSE_UML2_UML)
	}

}
