package org.example.domainmodel

import com.google.inject.Guice
import com.google.inject.Inject
import org.eclipse.xtext.ISetup
import org.eclipse.xtext.resource.FileExtensionProvider
import org.eclipse.xtext.resource.IResourceServiceProvider

/**
 * This class is needed for standalone runtime tests.
 */
class UMLStandaloneSetup implements ISetup {

	@Inject extension FileExtensionProvider 
	@Inject extension IResourceServiceProvider.Registry
	@Inject IResourceServiceProvider resourceServiceProvider

	override createInjectorAndDoEMFRegistration() {
		val injector = Guice.createInjector(new UMLRuntimeModule)
		
		injector.injectMembers(this)
		
		fileExtensions.forEach[extensionToFactoryMap.put(it, resourceServiceProvider)]
		
		injector
	}

}
