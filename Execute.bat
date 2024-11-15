@echo off
setlocal enabledelayedexpansion

:: Set the Miniforge installation path
set INSTALL_PATH=%LOCALAPPDATA%\Miniforge3

:: Set the name of the conda environment
set ENV_NAME=xml2csv

:: Set the paths to your Python scripts
set PYTHON_SCRIPT2=Plexos2BokehPivot.py
set PYTHON_SCRIPT3=CSV_concat.py

:: Set the paths to the folders to delete
set FOLDER1=PlexosOutputs
set FOLDER2=CSV

:: Activate Miniforge environment
echo Activating Miniforge environment '%ENV_NAME%'...
call "%INSTALL_PATH%\condabin\conda.bat" activate %ENV_NAME%

:: Run the first Python script
echo Running Python script '%PYTHON_SCRIPT2%'...
python "%PYTHON_SCRIPT2%"

:: Run the second Python script
echo Running Python script '%PYTHON_SCRIPT3%'...
python "%PYTHON_SCRIPT3%"

:: Deactivate the conda environment
echo Deactivating the conda environment...
call conda deactivate

:: Delete specified folders if they exist
echo Deleting folders if they exist...
if exist "%FOLDER1%" (
    rmdir /s /q "%FOLDER1%"
    echo Deleted folder '%FOLDER1%'.
) else (
    echo Folder '%FOLDER1%' does not exist.
)

if exist "%FOLDER2%" (
    rmdir /s /q "%FOLDER2%"
    echo Deleted folder '%FOLDER2%'.
) else (
    echo Folder '%FOLDER2%' does not exist.
)
