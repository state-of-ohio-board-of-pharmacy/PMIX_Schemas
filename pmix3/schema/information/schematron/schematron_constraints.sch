<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://www.ascc.net/xml/schematron">
	<sch:ns uri="http://xml.ijis.org/niem/2.0/extension" prefix="pmp"/>
	<sch:ns uri="http://niem.gov/niem/niem-core/2.0" prefix="nc"/>

	<sch:pattern name="Check for required elements">

		<!-- Segment: TH Transaction Header -->

		<sch:rule context="pmp:PharmacyReportingPrescriptionReport">
			<sch:assert test="pmp:VersionReleaseNumberText">
				pmp:PharmacyReportingPrescriptionReport must contain a pmp:VersionReleaseNumberText
			</sch:assert>
			<sch:assert test="pmp:TransactionControlNumberText">
				pmp:PharmacyReportingPrescriptionReport must contain a pmp:TransactionControlNumberText
			</sch:assert>
			<sch:assert test="pmp:FileTypeCode">
				pmp:PharmacyReportingPrescriptionReport must contain a pmp:FileTypeCode
			</sch:assert>
			<sch:assert test="pmp:ReportExecutionDate">
				pmp:PharmacyReportingPrescriptionReport must contain a pmp:ReportExecutionDate
			</sch:assert>
			<sch:assert test="pmp:ReportExecutionTime">
				pmp:PharmacyReportingPrescriptionReport must contain a pmp:ReportExecutionTime
			</sch:assert>
			<sch:assert test="pmp:UniqueInformationSourceIDText">
				pmp:PharmacyReportingPrescriptionReport must contain a pmp:UniqueInformationSourceIDText
			</sch:assert>
			<sch:assert test="pmp:InformationSourceEntityNameText">
				pmp:PharmacyReportingPrescriptionReport must contain a pmp:InformationSourceEntityNameText
			</sch:assert>
		</sch:rule>
	
		<sch:rule context="pmp:RequestResponsePrescriptionReport">
			<sch:assert test="pmp:ReportExecutionDate">
				pmp:RequestResponsePrescriptionReport must contain a pmp:ReportExecutionDate
			</sch:assert>
			<sch:assert test="pmp:ReportExecutionTime">
				pmp:RequestResponsePrescriptionReport must contain a pmp:ReportExecutionTime
			</sch:assert>
		</sch:rule>

		<!-- Segment: IS Information Source -->

		<!-- Handled in Segment: TH Transaction Header
		<sch:rule context="pmp:PharmacyReportingPrescriptionReport">
			<sch:assert test="pmp:UniqueInformationSourceIDText">
				pmp:PharmacyReportingPrescriptionReport must contain a pmp:UniqueInformationSourceIDText
			</sch:assert>
			<sch:assert test="pmp:InformationSourceEntityNameText">
				pmp:PharmacyReportingPrescriptionReport must contain a pmp:InformationSourceEntityNameText
			</sch:assert>
		</sch:rule> -->

		<!-- Segment: PHA Pharmacy Header -->

		<!-- No required elements. -->

		<!-- Segment: PAT Patient Information -->

		<sch:rule context="pmp:Patient">
			<sch:assert test="nc:PersonName/nc:PersonGivenName">
				pmp:Patient must contain a nc:PersonName that includes a nc:PersonGivenName.
			</sch:assert>
			<sch:assert test="nc:PersonName/nc:PersonSurName">
				pmp:Patient must contain a nc:PersonName that includes a nc:PersonSurName.
			</sch:assert>
			<sch:assert test="nc:PersonBirthDate">
				pmp:Patient must contain a nc:PersonBirthDate
			</sch:assert>
			<sch:assert test="pmp:PersonPrimaryContactInformation/nc:ContactMailingAddress/nc:StructuredAddress/nc:LocationStreet/nc:StreetFullText or pmp:PersonPrimaryContactInformation/nc:ContactEntity/nc:EntityOrganization/nc:OrganizationLocation/nc:LocationAddress/nc:StructuredAddress/nc:LocationStreet/nc:StreetFullText">
				pmp:Patient must contain a nc:ContactMailingAddress or a pmp:PersonPrimaryContactInformation that includes a nc:StreetFullText
			</sch:assert>
			<sch:assert test="pmp:PersonPrimaryContactInformation/nc:ContactMailingAddress/nc:StructuredAddress/nc:LocationCityName or pmp:PersonPrimaryContactInformation/nc:ContactEntity/nc:EntityOrganization/nc:OrganizationLocation/nc:LocationAddress/nc:StructuredAddress/nc:LocationCityName">
				pmp:Patient must contain a nc:ContactMailingAddress or a pmp:PersonPrimaryContactInformation that includes a nc:LocationCityName
			</sch:assert>
			<sch:assert test="pmp:PersonPrimaryContactInformation/nc:ContactMailingAddress/nc:StructuredAddress/nc:LocationPostalCode or pmp:PersonPrimaryContactInformation/nc:ContactEntity/nc:EntityOrganization/nc:OrganizationLocation/nc:LocationAddress/nc:StructuredAddress/nc:LocationPostalCode">
				pmp:Patient must contain a nc:ContactMailingAddress or a pmp:PersonPrimaryContactInformation that includes a nc:LocationPostalCode
			</sch:assert>
		</sch:rule>

		<!-- Segment: DSP Dispensing Record -->

		<sch:rule context="pmp:PrescriptionForReporting">
			<sch:assert test="pmp:ReportingStatusCode">
				pmp:PrescriptionForReporting must contain a pmp:ReportingStatusCode
			</sch:assert>
			<sch:assert test="pmp:PrescriptionNumberText">
				 pmp:Prescription must contain a pmp:PrescriptionNumberText
			</sch:assert>
			<sch:assert test="pmp:PrescriptionWrittenDate">
				 pmp:Prescription must contain a pmp:PrescriptionWrittenDate
			</sch:assert>
			<sch:assert test="pmp:RefillsAuthorizedCount">
				 pmp:Prescription must contain a pmp:RefillsAuthorizedCount
			</sch:assert>
			<sch:assert test="pmp:PrescriptionFilledDate">
				 pmp:Prescription must contain a pmp:PrescriptionFilledDate
			</sch:assert>
			<sch:assert test="pmp:DrugRefillNumberCount">
				 pmp:Prescription must contain a pmp:DrugRefillNumberCount
			</sch:assert>
			<sch:assert test="pmp:DispensedQuantity">
				 pmp:Prescription must contain a pmp:DispensedQuantity
			</sch:assert>
			<sch:assert test="pmp:DaysSupplyCount">
				 pmp:Prescription must contain a pmp:DaysSupplyCount
			</sch:assert>
		</sch:rule>

		<sch:rule context="pmp:PrescriptionDrug">
			<sch:assert test="pmp:DrugDINProductIdentifier or pmp:DrugHRIProductIdentifier or pmp:DrugNDCProductIdentifier or pmp:DrupUPCProductIdentifier or pmp:DrugUPNProductIdentifier">
				pmp:PrescriptionDrug must contain one of the following: pmp:DrugDINProductIdentifier, pmp:DrugHRIProductIdentifier, pmp:DrugNDCProductIdentifier, pmp:DrugUPCProductIdentifier, or pmp:DrugUPNProductIdentifier
			</sch:assert>
		</sch:rule>

		<sch:rule context="pmp:Prescription">
			<sch:assert test="pmp:PrescriptionNumberText">
				 pmp:Prescription must contain a pmp:PrescriptionNumberText
			</sch:assert>
			<sch:assert test="pmp:PrescriptionWrittenDate">
				 pmp:Prescription must contain a pmp:PrescriptionWrittenDate
			</sch:assert>
			<sch:assert test="pmp:RefillsAuthorizedCount">
				 pmp:Prescription must contain a pmp:RefillsAuthorizedCount
			</sch:assert>
			<sch:assert test="pmp:PrescriptionFilledDate">
				 pmp:Prescription must contain a pmp:PrescriptionFilledDate
			</sch:assert>
			<sch:assert test="pmp:DrugRefillNumberCount">
				 pmp:Prescription must contain a pmp:DrugRefillNumberCount
			</sch:assert>
			<sch:assert test="pmp:DispensedQuantity">
				 pmp:Prescription must contain a pmp:DispensedQuantity
			</sch:assert>
			<sch:assert test="pmp:DaysSupplyCount">
				 pmp:Prescription must contain a pmp:DaysSupplyCount
			</sch:assert>
		</sch:rule>

		<!-- Handled in Segment: DSP Dispensing Record
		<sch:rule context="pmp:PrescriptionForReporting">
			<sch:assert test="pmp:PrescriptionNumberText">
				 pmp:Prescription must contain a pmp:PrescriptionNumberText
			</sch:assert>
			<sch:assert test="pmp:PrescriptionWrittenDate">
				 pmp:Prescription must contain a pmp:PrescriptionWrittenDate
			</sch:assert>
			<sch:assert test="pmp:RefillsAuthorizedCount">
				 pmp:Prescription must contain a pmp:RefillsAuthorizedCount
			</sch:assert>
			<sch:assert test="pmp:PrescriptionFilledDate">
				 pmp:Prescription must contain a pmp:PrescriptionFilledDate
			</sch:assert>
			<sch:assert test="pmp:DrugRefillNumberCount">
				 pmp:Prescription must contain a pmp:DrugRefillNumberCount
			</sch:assert>
			<sch:assert test="pmp:DispensedQuantity">
				 pmp:Prescription must contain a pmp:DispensedQuantity
			</sch:assert>
			<sch:assert test="pmp:DaysSupplyCount">
				 pmp:Prescription must contain a pmp:DaysSupplyCount
			</sch:assert>
		</sch:rule> -->

		<!-- Segment: PRE Prescriber Information -->

		<sch:rule context="pmp:Dispenser">
			<sch:assert test="pmp:DEANumberIdentifier or pmp:NPIIdentifier or pmp:NCPDPIdentifier or pmp:StateLicenseIdentifier">
				pmp:Dispenser must contain one of the following: pmp:DEANumberIdentifier, pmp:NPIIdentifier, pmp:NCPDPIdentifier, or pmp:StateLicenseIdentifier
			</sch:assert>
		</sch:rule>

		<sch:rule context="pmp:Prescriber">
			<sch:assert test="pmp:DEANumberIdentifier or pmp:NPIIdentifier or pmp:StateLicenseIdentifier">
				pmp:Prescriber must contain one of the following: pmp:DEANumberIdentifier, pmp:NPIIdentifier, or pmp:StateLicenseIdentifier
			</sch:assert>
		</sch:rule>
		

		<!-- pmp:RequestDispenser is defined in the schemas, but never used -->
		<!--
		<sch:rule context="pmp:RequestDispenser">
			<sch:assert test="pmp:DEANumberIdentifier">
				pmp:RequestDispenser must contain a pmp:DEANumberIdentifier
			</sch:assert>
		</sch:rule>
		-->

		<!-- Segment: CDI Compound Drug Ingredient Detail -->
		<!--
		<sch:rule context="pmp:CompoundDrugIngredient">
			<sch:assert test="pmp:CompoundDrugIngredientDINProductIdentifier or pmp:CompoundDrugIngredientHRIProductIdentifier or pmp:CompoundDrugIngredientNDCProductIdentifier or pmp:CompoundDrugIngredientUPCProductIdentifier or pmp:CompoundDrugIngredientUPNProductIdentifier">
				 pmp:CompoundDrugIngredient must contain one of the following: pmp:CompoundDrugIngredientDINProductIdentifier, pmp:CompoundDrugIngredientHRIProductIdentifier, pmp:CompoundDrugIngredientNDCProductIdentifier, pmp:CompoundDrugIngredientUPCProductIdentifier, or pmp:CompoundDrugIngredientUPNProductIdentifier
			</sch:assert>
			<sch:assert test="pmp:CompoundDrugIngredientSequenceNumber">
				pmp:CompoundDrugIngredient must contain a pmp:CompoundDrugIngredientSequenceNumber
			</sch:assert>
			<sch:assert test="pmp:IngredientQuantity">
				pmp:CompoundDrugIngredient must contain a pmp:IngredientQuantity
			</sch:assert>
		</sch:rule>
		-->
		
		<!-- Segment: AIR Additional Information Reporting -->
		<!-- No required elements. -->


		<!-- Segment: PHA Pharmacy Header -->
		<!-- No required elements. -->

	</sch:pattern>
</sch:schema> 
