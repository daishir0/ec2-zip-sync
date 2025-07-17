@echo off
chcp 65001 > nul
setlocal enabledelayedexpansion

REM ===== 設定 =====
set PEM_PATH=.ssh\your-key.pem
set REMOTE_USER=your-user
set REMOTE_HOST=your.ec2.host.com

REM ===== 引数チェック =====
if "%~1"=="" (
    echo 使用方法: sync_zip_download.bat /remote/absolute/path
    exit /b 1
)

set REMOTE_DIR=%~1
for %%D in ("%REMOTE_DIR%") do set DIRNAME=%%~nxD
set ZIP_FILE=%DIRNAME%.zip
set LOCAL_TARGET_DIR=%CD%\%DIRNAME%

REM ===== 既存のローカルディレクトリ削除 =====
if exist "%LOCAL_TARGET_DIR%" (
    echo 既存のディレクトリを削除中: %LOCAL_TARGET_DIR%
    rmdir /s /q "%LOCAL_TARGET_DIR%"
)

REM ===== サーバーから zip 圧縮して転送 =====
echo サーバーから %REMOTE_DIR% を zip 圧縮してダウンロード中...
ssh -i "%PEM_PATH%" %REMOTE_USER%@%REMOTE_HOST% "cd \"$(dirname %REMOTE_DIR%)\" && zip -r - \"$(basename %REMOTE_DIR%)\"" > "%ZIP_FILE%"

if %ERRORLEVEL% NEQ 0 (
    echo ❌ エラー: zip 圧縮またはダウンロードに失敗しました。
    exit /b 1
)

REM ===== zipファイル展開 =====
echo 展開中: %ZIP_FILE%
powershell -Command "Expand-Archive -LiteralPath '%ZIP_FILE%' -DestinationPath '%CD%'"

if %ERRORLEVEL% NEQ 0 (
    echo ❌ エラー: zip の展開に失敗しました。
    exit /b 1
)

REM ===== zipファイル削除（任意） =====
del "%ZIP_FILE%"

echo ✅ 完了: %DIRNAME% ディレクトリを取得・展開しました。
pause
