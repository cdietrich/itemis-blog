/*
 * generated by Xtext 2.10.0
 */
package xtext.workshop.advanced.formatting.validation;

import java.util.ArrayList;
import java.util.List;
import org.eclipse.emf.ecore.EPackage;
import org.eclipse.xtext.validation.AbstractDeclarativeValidator;

public abstract class AbstractTableValidator extends AbstractDeclarativeValidator {
	
	@Override
	protected List<EPackage> getEPackages() {
		List<EPackage> result = new ArrayList<EPackage>();
		result.add(xtext.workshop.advanced.formatting.table.TablePackage.eINSTANCE);
		return result;
	}
	
}
