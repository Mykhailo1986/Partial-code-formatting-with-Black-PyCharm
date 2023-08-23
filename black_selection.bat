@echo off
setlocal

set black=%1
set input_file=%2
set start_line=%3
set end_line=%4


rem Part 1: Lines before start_line
(for /F "tokens=1,* delims=:" %%A in ('findstr /N "^" %input_file%') do (
    if %%A lss %start_line% (    
        set "line=%%B"
        if defined line (
            echo %%B
        ) else (
            echo.
        )
    )
)) > tmpfile1.py

rem Part 2: Lines within start_line and end_line
(for /F "tokens=1,* delims=:" %%A in ('findstr /N "^" %input_file%') do (
    if %%A geq %start_line% if %%A leq %end_line% (
         set "line=%%B"
        if defined line (
            echo %%B
        ) else (
            echo.
        )
    )
)) > tmpfile2.py

rem Part 3: Lines after end_line
(for /F "tokens=1,* delims=:" %%A in ('findstr /N "^" %input_file%') do (
    if %%A gtr %end_line% (
     set "line=%%B"
        if defined line (
            echo %%B
        ) else (
            echo.
        )
    )
)) > tmpfile3.py

rem Apply Black formatting to tmp_file2 (Python code)
%black% tmpfile2.py

rem Combine the temporary files
rem copy /y tmpfile1.py + tmpfile2.py + tmpfile3.py %input_file%
type tmpfile1.py tmpfile2.py tmpfile3.py > %input_file%

rem Clean up temporary files
del tmpfile1.py
del tmpfile2.py
del tmpfile3.py

endlocal





