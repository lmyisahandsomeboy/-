#Author:NEU_liebe
#date:2024/11/25
#使用时请把查找对象无空格地添加到Liebenames文件下。每个单个元素都要换行保存。
$studentListPath = "Liebenames.txt"
$outputFilePath = "LiebeUnSubmitted.txt"
$students = Get-Content -Path $studentListPath -Encoding UTF8
$files = Get-ChildItem -Path "." | Select-Object -ExpandProperty Name
$unsubmittedStudents = @()
foreach ($student in $students) {
    Write-Host "Finding: $student"
    $found = $false
    foreach ($file in $files) {
        if ($file -like "*$student*") {
            Write-Host "Found: $file"
            $found = $true
            break
        }
    }
    if (-not $found) {
        Write-Host "Not Found: $student"
        $unsubmittedStudents += $student
    }
}
"No Submission" | Out-File -FilePath $outputFilePath -Encoding UTF8
$unsubmittedStudents | Out-File -FilePath $outputFilePath -Encoding UTF8 -Append
Write-Host "Results have been memoried $outputFilePath"
Write-Host "By liebe"