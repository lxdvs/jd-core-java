ARCH=linux/x86_64

all:
	Error: you must use one of the following: 'make osx32', 'make linux32', 'make osx64', 'make linux64'

osx32: jd-core-java-1.0.jar libjd-intellij.so.osx32

linux32: jd-core-java-1.0.jar libjd-intellij.so.linux32

osx64: jd-core-java-1.0.jar libjd-intellij.so.osx64

linux64: jd-core-java-1.0.jar libjd-intellij.so.linux64

jd-intellij:
	hg clone https://bitbucket.org/bric3/jd-intellij

libjd-intellij.so.osx64: jd-intellij
	cp jd-intellij/src/main/native/nativelib/macosx/x86_64/libjd-intellij.* ./libjd-intellij.so

libjd-intellij.so.linux64: jd-intellij
	cp jd-intellij/src/main/native/nativelib/linux/x86_64/libjd-intellij.* ./libjd-intellij.so

libjd-intellij.so.linux32: jd-intellij
	cp jd-intellij/src/main/native/nativelib/linux/x86/libjd-intellij.* ./libjd-intellij.so

libjd-intellij.so.osx32: jd-intellij
	cp jd-intellij/src/main/native/nativelib/macosx/x86/libjd-intellij.* ./libjd-intellij.so

target/jd-core-java-1.0.jar:
	mvn package

jd-core-java-1.0.jar: target/jd-core-java-1.0.jar
	cp $< $@

clean:
	rm -rf jd-core-java-1.0.jar libjd-intellij.so target jd-intellij
