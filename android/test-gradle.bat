@echo off
set JAVA_EXE="D:\KULIAH\APLIKASI\Android Studio\jbr\bin\java.exe"
set CLASSPATH="%~dp0gradle\wrapper\gradle-wrapper.jar"
echo Running: %JAVA_EXE% -classpath %CLASSPATH% org.gradle.wrapper.GradleWrapperMain %*
%JAVA_EXE% -classpath %CLASSPATH% org.gradle.wrapper.GradleWrapperMain %*