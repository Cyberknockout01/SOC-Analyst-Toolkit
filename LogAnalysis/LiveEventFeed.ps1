$Query = @"
<QueryList>
  <Query Id="0" Path="Security">
    <Select Path="Security">*[System[(EventID=4625 or EventID=4624)]]</Select>
  </Query>
</QueryList>
"@

Register-WinEvent -Query $Query -Action {
    Write-Host "[$($Event.TimeCreated)] $($Event.Message)" -ForegroundColor Cyan
}