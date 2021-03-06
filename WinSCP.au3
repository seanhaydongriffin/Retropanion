#include-once
#include <Array.au3>

Const Enum _
        $__eWSCP_SO_Protocol_Sftp, _
        $__eWSCP_SO_Protocol_Scp, _
        $__eWSCP_SO_Protocol_Ftp
Const Enum _
        $__eWSCP_TO_TransferMode_Binary, _
        $__eWSCP_TO_TransferMode_Ascii, _
        $__eWSCP_TO_TransferMode_Automatic

Global $oSession
Global $_WinSCP_COM_error = False
Global $_WinSCP_COM_error_description = ""

#cs
	With $oSession

        ; Connect: Open sesion with defined options
        .Open($oSessionOptions);

        ; Set TransferOptions
        Local $oTransferOptions = ObjCreate("WinSCP.TransferOptions")
        $oTransferOptions.TransferMode = $__eWSCP_TO_TransferMode_Binary
        ; Upload files: put @ScriptFullPath to the ROOT directory
        Local $oTransferResult = .PutFiles($sFilesToPut, '/');

        ; Throw on any error
        $oTransferResult.Check

        ; Print results
        For $oTransfer In $oTransferResult.Transfers
            ConsoleWrite("Upload of " & $oTransfer.FileName & " succeeded" & @CRLF)
        Next

        ;' Disconnect, clean up
        .Dispose()
    EndWith
#ce



Func _WinSCP_Open()

	Local $oErrorHandler = ObjEvent("AutoIt.Error", "_ErrFunc")
	Local $oSessionOptions = ObjCreate("WinSCP.SessionOptions");
    With $oSessionOptions
        .Protocol = $__eWSCP_SO_Protocol_Scp
        .HostName = "retropie"
        .UserName = "pi"
        .Password = "raspberry"
        .SshHostKeyFingerprint = "ssh-ed25519 255 cq4AFscwWDozkpWLAzpJmZak8M7USnljP1lO36e23Co="
    EndWith

    $oSession = ObjCreate("WinSCP.Session");
	;$oSession.SessionLogPath = "D:\dwn\winscp_log.txt"
	$oSession.Open($oSessionOptions)

	if IsObj($oSession) = True Then

		ConsoleWrite("$oSession is an object")
	Else

		ConsoleWrite("$oSession is not an object")
	EndIf

	if $_WinSCP_COM_error = True Then

		Return False
	EndIf

	Return True

EndFunc

Func _WinSCP_RemoveFile($remote_file_path)

	$oSession.RemoveFile($remote_file_path)

	if $_WinSCP_COM_error = True Then

		Return False
	EndIf

	Return True

EndFunc

Func _WinSCP_GetFiles($remote_file_path, $local_file_path)

	; Set TransferOptions
	Local $oTransferOptions = ObjCreate("WinSCP.TransferOptions")
	$oTransferOptions.TransferMode = $__eWSCP_TO_TransferMode_Binary

	if IsObj($oSession) = False Then

		Return False
	EndIf

	; Upload files: put @ScriptFullPath to the ROOT directory
	Local $oTransferResult = $oSession.GetFiles($remote_file_path, $local_file_path, False, $oTransferOptions)

	if $_WinSCP_COM_error = True Then

		Return False
	EndIf

	; Throw on any error
	$oTransferResult.Check

	if $_WinSCP_COM_error = True Then

		Return False
	EndIf

	; Print results
	For $oTransfer In $oTransferResult.Transfers
		ConsoleWrite("Upload of " & $oTransfer.FileName & " succeeded" & @CRLF)
	Next

	Return True

EndFunc

Func _WinSCP_PutFiles($local_file_path, $remote_file_path)

	; Set TransferOptions
	Local $oTransferOptions = ObjCreate("WinSCP.TransferOptions")
	$oTransferOptions.TransferMode = $__eWSCP_TO_TransferMode_Binary
	$oTransferOptions.PreserveTimestamp = 0

	if IsObj($oSession) = False Then

		Return False
	EndIf

	; Upload files: put @ScriptFullPath to the ROOT directory
	Local $oTransferResult = $oSession.PutFiles($local_file_path, $remote_file_path, False, $oTransferOptions)

	if $_WinSCP_COM_error = True Then

		Return False
	EndIf

	; Throw on any error
	$oTransferResult.Check

	if $_WinSCP_COM_error = True Then

		Return False
	EndIf

	; Print results
	For $oTransfer In $oTransferResult.Transfers
		ConsoleWrite("Upload of " & $oTransfer.FileName & " succeeded" & @CRLF)
	Next

	Return True

EndFunc




Func _WinSCP_ExecuteCommand($command)

	if IsObj($oSession) = False Then

		Return False
	EndIf

	Local $oCommandExecutionResult = $oSession.ExecuteCommand($command)

	if $_WinSCP_COM_error = True Then

		Return False
	EndIf

	; Throw on any error
	$oCommandExecutionResult.Check

	if $_WinSCP_COM_error = True Then

		Return False
	EndIf

	Return $oCommandExecutionResult.Output

EndFunc






Func _WinSCP_ListDirectory_Directories($path)

	if IsObj($oSession) = False Then

		Return Null
	EndIf

	$directoryInfo = $oSession.ListDirectory($path)

;	Local $rr = $directoryInfo.Files.count()
;	ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $rr = ' & $rr & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console

	Local $num_dirs = 0

	For $fileInfo In $directoryInfo.Files

		if $fileInfo.IsDirectory = True And ($fileInfo.IsParentDirectory = False And $fileInfo.IsThisDirectory = False) Then

			$num_dirs = $num_dirs + 1
		EndIf
	Next

	Local $arr[$num_dirs]
	Local $dir_num = -1

	For $fileInfo In $directoryInfo.Files

		if $fileInfo.IsDirectory = True And ($fileInfo.IsParentDirectory = False And $fileInfo.IsThisDirectory = False) Then

			$dir_num = $dir_num + 1
			$arr[$dir_num] = $fileInfo.Name
		EndIf
	Next

	Return $arr

EndFunc


Func _WinSCP_ListDirectory_Files($path, $filter = "")

	if IsObj($oSession) = False Then

		Return Null
	EndIf

	$directoryInfo = $oSession.ListDirectory($path)
	Local $num_files = 0

	For $fileInfo In $directoryInfo.Files

		if $fileInfo.IsDirectory = False Then

			if StringLen($filter) > 0 Then

				Local $match = StringRegExp($fileInfo.Name, $filter, 0)
;				ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $match = ' & $match & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console

				if $match = 1 Then

					$num_files = $num_files + 1
				EndIf
			Else

				$num_files = $num_files + 1
			EndIf

		EndIf
	Next

	Local $arr[$num_files]
	Local $file_num = -1

	For $fileInfo In $directoryInfo.Files

		if $fileInfo.IsDirectory = False Then


			if StringLen($filter) > 0 Then

				Local $match = StringRegExp($fileInfo.Name, $filter, 0)

				if $match = 1 Then

					$file_num = $file_num + 1
					$arr[$file_num] = $fileInfo.Name
				EndIf
			Else

				$file_num = $file_num + 1
				$arr[$file_num] = $fileInfo.Name
			EndIf

		EndIf
	Next

	Return $arr

EndFunc


Func _WinSCP_Close()

	if IsObj($oSession) = False Then

		Return False
	EndIf

	$oSession.Dispose()
	$oSession = Null

	Return True

EndFunc


Func _ErrFunc($oError)


    ; Do anything here.
    ConsoleWrite(@ScriptName & " (" & $oError.scriptline & ") : ==> COM Error intercepted !" & @CRLF & _
            @TAB & "err.number is: " & @TAB & @TAB & "0x" & Hex($oError.number) & @CRLF & _
            @TAB & "err.windescription:" & @TAB & $oError.windescription & @CRLF & _
            @TAB & "err.description is: " & @TAB & $oError.description & @CRLF & _
            @TAB & "err.source is: " & @TAB & @TAB & $oError.source & @CRLF & _
            @TAB & "err.helpfile is: " & @TAB & $oError.helpfile & @CRLF & _
            @TAB & "err.helpcontext is: " & @TAB & $oError.helpcontext & @CRLF & _
            @TAB & "err.lastdllerror is: " & @TAB & $oError.lastdllerror & @CRLF & _
            @TAB & "err.scriptline is: " & @TAB & $oError.scriptline & @CRLF & _
            @TAB & "err.retcode is: " & @TAB & "0x" & Hex($oError.retcode) & @CRLF & @CRLF)

	$_WinSCP_COM_error = True
	$_WinSCP_COM_error_description = $oError.description

EndFunc   ;==>_ErrFunc

