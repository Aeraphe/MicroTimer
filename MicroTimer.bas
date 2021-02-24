
Attribute VB_Name = "MicroTimer"

'namespace=xvba_modules\MicroTimer

Option Explicit 

' Charles Williams
' COPYRIGHT � DECISION MODELS LIMITED 2006. All rights reserved
' May be redistributed for free but
' may not be sold without the author's explicit permission.
'
Private Declare Function getFrequency Lib "kernel32" Alias _ 
"QueryPerformanceFrequency" (cyFrequency As Currency) As Long 
Private Declare Function getTickCount Lib "kernel32" Alias _ 
"QueryPerformanceCounter" (cyTickCount As Currency) As Long 
 
Private Const sCPURegKey = "HARDWARE\DESCRIPTION\System\CentralProcessor\0" 
Private Const HKEY_LOCAL_MACHINE As Long = &H80000002 
Private Declare Function RegCloseKey Lib "advapi32.dll" (ByVal hKey As Long) As Long 
Private Declare Function RegOpenKey Lib "advapi32.dll" Alias "RegOpenKeyA" (ByVal hKey As Long, ByVal lpSubKey As String, phkResult As Long) As Long 
Private Declare Function RegQueryValueEx Lib "advapi32.dll" Alias "RegQueryValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal lpReserved As Long, lpType As Long, lpData As Any, lpcbData As Long) As Long 
 
Public Function getValue() As Double 
  '
  ' returns seconds
  '
  Dim cyTicks1 As Currency 
  Static cyFrequency As Currency 
  '
  getValue = 0 
  If cyFrequency = 0 Then getFrequency cyFrequency ' get ticks/sec
    getTickCount cyTicks1 ' get ticks
    If cyFrequency Then getValue = cyTicks1 / cyFrequency ' calc seconds
     
End Function 