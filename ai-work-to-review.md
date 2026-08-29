# ASAP 5.0 PMIX4 Schema Changes — AI Work to Review

## Files Modified

- `pmix4/schema/information/code_set/PMIX_Code_Set.xsd`
- `pmix4/schema/information/extension/PMP_NIEM_4.0_Domain_Extension_Schema.xsd`

## Code Set (`PMIX_Code_Set.xsd`) Changes

| Type | Status | Description |
|------|--------|-------------|
| `RelationshipToPatientCodeType` | Updated | Removed "Patient" as 01. Now: 01=Parent/Legal Guardian, 02=Spouse, 03=Caregiver, 99=Other (AIR06) |
| `DroppingOffRelationshipToPatientCodeType` | New | 01=Parent/Legal Guardian, 02=Spouse, 03=Caregiver, 04=Other (AIR23 — uses different "Other" code than AIR06) |
| `GenderCodeSimpleType` / `GenderCodeType` | New | M, F, U=Unknown/Undisclosed, N=Nonbinary, X=Unspecified/Other (PAT19) |
| `PharmacyDispenserTypeCodeSimpleType` / `CodeType` | New | 12 codes: 01-11, 99 per ASAP 5.0 (PHA14) |
| `MethodOfDeliveryCodeSimpleType` / `CodeType` | New | 01=Person Picked Up, 02=Mailed/Shipped (AIR19) |
| `VeterinarySpeciesCodeSimpleType` / `CodeType` | New | 01-06, 99 (PAT28) |
| `AnimalLocationCodeSimpleType` / `CodeType` | New | 01-06, 99 (PAT29) |
| `DEAScheduleStateDesignationCodeSimpleType` / `CodeType` | New | 01-07, 99 (DSP34/CDI06) |

## Extension Schema (`PMP_NIEM_4.0_Domain_Extension_Schema.xsd`) Changes

### Bug Fixes (Pre-existing)

- Fixed `SpeciesCode` element missing closing `>` on tag
- Fixed `StateIssuedRxSerialNumberIdentification` truncated/corrupted documentation

### New Elements

| Element | ASAP Field | Type | Notes |
|---------|-----------|------|-------|
| `PharmacyDispensingSoftwareVendorText` | IS04 | `nc:TextType` | |
| `PharmacyDispensingSoftwareVendorPhoneNumberText` | IS05 | `nc:TextType` | |
| `PharmacyDispenserTypeCode` | PHA14 | `pmpcd:PharmacyDispenserTypeCodeType` | |
| `MailOrderPharmacyIndicator` | PHA15 | `niem-xsd:boolean` | |
| `PatientGenderCode` | PAT19 | `pmpcd:GenderCodeType` | Includes N, X codes |
| `PatientCountryOfNonUSResidentText` | PAT22 | `nc:TextType` | |
| `PatientRaceCategoryText` | PAT26 | `nc:TextType` | |
| `PatientEthnicityText` | PAT27 | `nc:TextType` | |
| `VeterinarySpeciesCode` | PAT28 | `pmpcd:VeterinarySpeciesCodeType` | |
| `AnimalLocationCode` | PAT29 | `pmpcd:AnimalLocationCodeType` | |
| `DrugCannabisProductIdentifier` | DSP07=07 | `nc:IdentificationType` | substitutionGroup for DrugProductIdentifier |
| `RemainingQuantityDrugDosageUnitsCode` | DSP30 | `pmpcd:DrugDosageUnitsCodeType` | |
| `DiscountCardCode` | DSP31 | `nc:TextType` | |
| `ClassificationCodeForAdditionalPaymentType` | DSP32 | `nc:TextType` | |
| `DiscountCardForAdditionalPaymentType` | DSP33 | `nc:TextType` | |
| `DEAScheduleStateDesignationCode` | DSP34 | `pmpcd:DEAScheduleStateDesignationCodeType` | |
| `PharmacistFillingLastNameText` | DSP35 | `nc:TextType` | Moved from AIR09 |
| `PharmacistFillingFirstNameText` | DSP36 | `nc:TextType` | Moved from AIR10 |
| `CompoundDrugIngredientDEAScheduleStateDesignationCode` | CDI06 | `pmpcd:DEAScheduleStateDesignationCodeType` | |
| `MethodOfDeliveryCode` | AIR19 | `pmpcd:MethodOfDeliveryCodeType` | |
| `DroppingOffRelationshipToPatientCode` | AIR23 | `pmpcd:DroppingOffRelationshipToPatientCodeType` | |
| `PersonPickingUpRx` | AIR03-19 | `pmp:PersonPickingUpRxType` | |
| `PersonDroppingOffRx` | AIR20-32 | `pmp:PersonDroppingOffRxType` | |

### Data Type Corrections

| Element | Was | Now | Reason |
|---------|-----|-----|--------|
| `RemainingQuantity` (DSP29) | `xsd:nonNegativeInteger` | `niem-xsd:decimal` | ASAP type is D 11 (Decimal) |
| `TimeWritten` (DSP26) | `xsd:dateTime` | `niem-xsd:token` | ASAP type is TM 7 (HHMMSSZ) |
| `TimeFilled` (DSP27) | `xsd:dateTime` | `niem-xsd:token` | ASAP type is TM 7 (HHMMSSZ) |
| `TimeSold` (DSP28) | `xsd:dateTime` | `niem-xsd:token` | ASAP type is TM 7 (HHMMSSZ) |

### Updated Complex Types

| Type | Changes |
|------|---------|
| `PatientType` | Added PatientGenderCode, PatientCountryOfNonUSResidentText, PatientPreferredOrAliasLastName/FirstName, PatientRaceCategoryText, PatientEthnicityText, VeterinarySpeciesCode, AnimalLocationCode |
| `DispenserType` | Added PharmacyDispenserTypeCode, MailOrderPharmacyIndicator |
| `CompoundDrugIngredientType` | Added CompoundDrugIngredientDEAScheduleStateDesignationCode |
| `PrescriptionType` | Added RemainingQuantityDrugDosageUnitsCode, DiscountCardCode, ClassificationCodeForAdditionalPaymentType, DiscountCardForAdditionalPaymentType, DEAScheduleStateDesignationCode, PharmacistFillingLastNameText/FirstNameText, PersonPickingUpRx, PersonDroppingOffRx |
| `PersonPickingUpRxType` | Added PersonPrimaryContactInformation, MethodOfDeliveryCode |
| `PersonDroppingOffRxType` | Added PersonPrimaryContactInformation; uses DroppingOffRelationshipToPatientCode (04=Other) instead of RelationshipToPatientCode (99=Other) |
| `PharmacyReportingPrescriptionReportType` | Added PharmacyDispensingSoftwareVendorText, PharmacyDispensingSoftwareVendorPhoneNumberText |

## Items to Review

- **PAT26/PAT27 (Race/Ethnicity)**: Mapped as `nc:TextType`. ASAP defines numeric codes (N 2) for these. Could be changed to proper code types if enumerated values are desired.
- **DSP31/DSP33 (Discount Card)**: Mapped as `nc:TextType`. ASAP defines as N 2 with codes 01=Yes, 02=No. Could be a boolean or code type.
- **DSP32 (Classification Code for Additional Payment Type)**: Mapped as `nc:TextType`. Uses same codes as DSP16 (MethodOfPaymentCodeType). Could reuse that type.
- **PRE11-15 (Prescriber Address)**: Handled via existing `PersonPrimaryContactInformation` (nc:ContactInformationType) in PrescriberType, which is the NIEM pattern for address+phone. No separate elements added.
- **PAT28/PAT29**: The Excel noted "May not include" for these fields. They were added since they are in the ASAP 5.0 spec.
