# ASAP 5.0 Fields to Consider for PMIX4

## New Fields Not Yet Implemented

| ASAP Field | Name | Type | Optionality | Notes |
|------------|------|------|-------------|-------|
| DSP20 | Electronic Prescription Reference Number | AN 35 | Optional | Populated from SCRIPT transaction. Increasingly relevant as e-prescribing grows. |
| DSP21 | Electronic Prescription Order Number | AN 35 | Optional | Should be reported as a pair with DSP20. |
| DSP23 | Rx SIG (Directions) | AN 200 | Optional | Actual directions printed on the prescription vial label. Truncation allowed beyond 200 chars. |
| PRE10 | Jurisdiction or State Issuing Prescriber License Number | AN 2 | Situational | Used to further identify PRE04 (Prescriber License Number). |

## Fields Implemented as TextType That Should Be Code Types

| ASAP Field | Name | Current PMIX Type | ASAP Codes | Recommendation |
|------------|------|-------------------|------------|----------------|
| PAT26 | Patient Race Category | `nc:TextType` | 01 American Indian/Alaskan Native, 02 Asian, 03 Black/African American, 04 Native Hawaiian/Pacific Islander, 05 White, 06 Multiracial, 99 Other/Unknown | Create `PatientRaceCategoryCodeType` |
| PAT27 | Patient Ethnicity | `nc:TextType` | 01 Hispanic or Latino, 02 Not Hispanic or Latino, 99 Undisclosed/Unknown | Create `PatientEthnicityCodeType` |
| DSP31 | Discount Card | `nc:TextType` | 01 Yes, 02 No | Create `YesNoCodeType` or use `niem-xsd:boolean` |
| DSP32 | Classification Code for Additional Payment Type | `nc:TextType` | Same codes as DSP16 (01-07, 99) | Reuse existing `MethodOfPaymentCodeType` |
| DSP33 | Discount Card for Additional Payment Type | `nc:TextType` | 01 Yes, 02 No | Same as DSP31 |

## Deprecation Candidate

| ASAP Field | Name | Status | Notes |
|------------|------|--------|-------|
| PRE09 | XDEA Number | Decommissioned in ASAP 5.0 | DEA no longer issues XDEA numbers. Our schema still has `XDEAIndicator` boolean and `DEANumberIdentifierType` that extends with it. Should add deprecation annotation or remove. |
