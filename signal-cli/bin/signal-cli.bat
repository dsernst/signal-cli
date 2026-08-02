@rem
@rem Copyright 2015 the original author or authors.
@rem
@rem Licensed under the Apache License, Version 2.0 (the "License");
@rem you may not use this file except in compliance with the License.
@rem You may obtain a copy of the License at
@rem
@rem      https://www.apache.org/licenses/LICENSE-2.0
@rem
@rem Unless required by applicable law or agreed to in writing, software
@rem distributed under the License is distributed on an "AS IS" BASIS,
@rem WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
@rem See the License for the specific language governing permissions and
@rem limitations under the License.
@rem
@rem SPDX-License-Identifier: Apache-2.0
@rem

@if "%DEBUG%"=="" @echo off
@rem ##########################################################################
@rem
@rem  signal-cli startup script for Windows
@rem
@rem ##########################################################################

@rem Set local scope for the variables, and ensure extensions are enabled
setlocal EnableExtensions

set DIRNAME=%~dp0
if "%DIRNAME%"=="" set DIRNAME=.
@rem This is normally unused
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%..

@rem Resolve any "." and ".." in APP_HOME to make it shorter.
for %%i in ("%APP_HOME%") do set APP_HOME=%%~fi

@rem Add default JVM options here. You can also use JAVA_OPTS and SIGNAL_CLI_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS="--enable-native-access=ALL-UNNAMED"

@rem Find java.exe
if defined JAVA_HOME goto findJavaFromJavaHome

set JAVA_EXE=java.exe
%JAVA_EXE% -version >NUL 2>&1
if %ERRORLEVEL% equ 0 goto execute

echo. 1>&2
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH. 1>&2
echo. 1>&2
echo Please set the JAVA_HOME variable in your environment to match the 1>&2
echo location of your Java installation. 1>&2

"%COMSPEC%" /c exit 1

:findJavaFromJavaHome
set JAVA_HOME=%JAVA_HOME:"=%
set JAVA_EXE=%JAVA_HOME%/bin/java.exe

if exist "%JAVA_EXE%" goto execute

echo. 1>&2
echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME% 1>&2
echo. 1>&2
echo Please set the JAVA_HOME variable in your environment to match the 1>&2
echo location of your Java installation. 1>&2

"%COMSPEC%" /c exit 1

:execute
@rem Setup the command line

set CLASSPATH=%APP_HOME%\lib\signal-cli-0.14.7.jar;%APP_HOME%\lib\libsignal-cli-0.14.7.jar;%APP_HOME%\lib\bcprov-jdk18on-1.85.jar;%APP_HOME%\lib\jackson-core-2.22.1.jar;%APP_HOME%\lib\signal-network-2.15.3_unofficial_151.jar;%APP_HOME%\lib\signal-service-java-2.15.3_unofficial_151.jar;%APP_HOME%\lib\core-network-2.15.3_unofficial_151.jar;%APP_HOME%\lib\jackson-module-kotlin-2.22.1.jar;%APP_HOME%\lib\jackson-databind-2.22.1.jar;%APP_HOME%\lib\argparse4j-0.9.0.jar;%APP_HOME%\lib\dbus-java-transport-native-unixsocket-5.0.0.jar;%APP_HOME%\lib\jul-to-slf4j-2.0.18.jar;%APP_HOME%\lib\logback-classic-1.6.1.jar;%APP_HOME%\lib\dbus-java-core-5.0.0.jar;%APP_HOME%\lib\micronaut-json-schema-generator-2.1.0.jar;%APP_HOME%\lib\micronaut-json-schema-annotations-2.1.0.jar;%APP_HOME%\lib\micronaut-sourcegen-generator-java-2.1.0.jar;%APP_HOME%\lib\micronaut-sourcegen-generator-2.1.0.jar;%APP_HOME%\lib\micronaut-sourcegen-model-2.1.0.jar;%APP_HOME%\lib\micronaut-sourcegen-annotations-2.1.0.jar;%APP_HOME%\lib\micronaut-serde-jackson-3.1.0.jar;%APP_HOME%\lib\micronaut-json-schema-common-2.1.0.jar;%APP_HOME%\lib\micronaut-serde-support-3.1.0.jar;%APP_HOME%\lib\micronaut-serde-api-3.1.0.jar;%APP_HOME%\lib\micronaut-core-processor-5.1.6.jar;%APP_HOME%\lib\micronaut-jackson-core-5.1.6.jar;%APP_HOME%\lib\micronaut-json-core-5.1.6.jar;%APP_HOME%\lib\micronaut-http-5.1.6.jar;%APP_HOME%\lib\micronaut-context-propagation-5.1.6.jar;%APP_HOME%\lib\micronaut-context-5.1.6.jar;%APP_HOME%\lib\micronaut-aop-5.1.6.jar;%APP_HOME%\lib\micronaut-inject-5.1.6.jar;%APP_HOME%\lib\HikariCP-7.1.0.jar;%APP_HOME%\lib\micronaut-core-reactive-5.1.6.jar;%APP_HOME%\lib\micronaut-core-5.1.6.jar;%APP_HOME%\lib\slf4j-api-2.0.18.jar;%APP_HOME%\lib\core-3.5.4.jar;%APP_HOME%\lib\jackson-databind-3.1.4.jar;%APP_HOME%\lib\jackson-core-3.1.4.jar;%APP_HOME%\lib\jackson-annotations-2.22.jar;%APP_HOME%\lib\logback-core-1.6.1.jar;%APP_HOME%\lib\sqlite-jdbc-3.53.2.1.jar;%APP_HOME%\lib\jakarta.inject-api-2.0.1.jar;%APP_HOME%\lib\jakarta.annotation-api-2.1.1.jar;%APP_HOME%\lib\serialization-2.15.3_unofficial_151.jar;%APP_HOME%\lib\models-jvm-2.15.3_unofficial_151.jar;%APP_HOME%\lib\util-jvm-2.15.3_unofficial_151.jar;%APP_HOME%\lib\libsignal-client-0.99.1.jar;%APP_HOME%\lib\kotlinx-coroutines-core-jvm-1.10.2.jar;%APP_HOME%\lib\javaparser-symbol-solver-core-3.28.0.jar;%APP_HOME%\lib\jspecify-1.0.0.jar;%APP_HOME%\lib\kotlin-reflect-2.3.21.jar;%APP_HOME%\lib\kotlin-stdlib-jdk8-2.3.21.jar;%APP_HOME%\lib\rxkotlin-3.0.1.jar;%APP_HOME%\lib\kotlinx-serialization-core-jvm-1.9.0.jar;%APP_HOME%\lib\kotlinx-serialization-json-jvm-1.9.0.jar;%APP_HOME%\lib\wire-runtime-jvm-6.0.0-alpha02.jar;%APP_HOME%\lib\okhttp-jvm-5.3.2.jar;%APP_HOME%\lib\okio-jvm-3.17.0.jar;%APP_HOME%\lib\kotlin-stdlib-jdk7-2.3.21.jar;%APP_HOME%\lib\arrow-core-jvm-2.2.2.1.jar;%APP_HOME%\lib\arrow-atomic-jvm-2.2.2.1.jar;%APP_HOME%\lib\arrow-annotations-jvm-2.2.2.1.jar;%APP_HOME%\lib\arrow-exception-utils-jvm-2.2.2.1.jar;%APP_HOME%\lib\kotlin-stdlib-2.3.21.jar;%APP_HOME%\lib\rxjava-3.1.12.jar;%APP_HOME%\lib\reactor-core-3.7.12.jar;%APP_HOME%\lib\reactive-streams-1.0.4.jar;%APP_HOME%\lib\asm-9.9.1.jar;%APP_HOME%\lib\libphonenumber-9.0.29.jar;%APP_HOME%\lib\annotations-23.0.0.jar;%APP_HOME%\lib\jsr305-3.0.2.jar;%APP_HOME%\lib\javaparser-core-3.28.0.jar;%APP_HOME%\lib\checker-qual-3.53.0.jar


@rem Execute signal-cli
@rem endlocal doesn't take effect until after the line is parsed and variables are expanded
@rem which allows us to clear the local environment before executing the java command
endlocal & "%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %SIGNAL_CLI_OPTS%  -classpath "%CLASSPATH%" org.asamk.signal.Main %* & call :exitWithErrorLevel

:exitWithErrorLevel
@rem Use "%COMSPEC%" /c exit to allow operators to work properly in scripts
"%COMSPEC%" /c exit %ERRORLEVEL%
