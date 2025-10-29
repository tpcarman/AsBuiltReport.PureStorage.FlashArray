# culture = 'en-US'
@{
# Update the following string data as needed for new report modules
# Use the same keys as in other AsBuiltReport language files for consistency
# Use the placeholder {0}, {1}, etc. for dynamic values
# Example: 'ModuleName = {0} is currently installed.' -f $ModuleName
# Update GetAbrFunctionName as needed for private functions in the module
# Refer to AsBuiltReport website for more information on creating report modules
# https://www.asbuiltreport.com/dev-guide/creating-a-report-module/
GetAbrFunctionName = ConvertFrom-StringData @'
    InfoLevel  = {0} InfoLevel set at {1}.
    Collecting  = Collecting System {2} information.
    ParagraphDetail = The following sections detail the system {2}.
    ParagraphSummary = The following table summarises the system {2}.
'@
}
